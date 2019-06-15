; default setting
process_limit := 8

IniRead, in_path, %A_WorkingDir%\setting.ini, main, in_path, %A_Space%
IniRead, out_path, %A_WorkingDir%\setting.ini, main, out_path,  %A_Space%
IniRead, noise_level, %A_WorkingDir%\setting.ini, main, noise_level, 2
IniRead, scale, %A_WorkingDir%\setting.ini, main, scale, 2
IniRead, win_mode, %A_WorkingDir%\setting.ini, main, win_mode, Hide
IniRead, config_ext, %A_WorkingDir%\setting.ini, main, config_ext, png

Loop, Files, %A_WorkingDir%\models\*info.json, FR
{
	model_trim_l := StrLen(A_WorkingDir) + 8
	StringTrimLeft, add_list, A_LoopFilePath, %model_trim_l%
	StringTrimRight, add_list, add_list, 10
	if(!model_list)
	{
		model_list := add_list
		continue
	}
	model_list := model_list "|" add_list
}

; input/out path
Gui, Add, Text, x12 y9 w80 h20 , Input Folder :
Gui, Add, Edit, x102 y9 w180 h20 vin_path ggui_update, %in_path%
Gui, Add, Text, x12 y29 w80 h20 , Output Folder :
Gui, Add, Edit, x102 y29 w180 h20 vout_path ggui_update, %out_path%

; noise level config
Gui, Add, Text, x12 y149 w70 h20 , Noise Level :
Gui, Add, Radio, x102 y149 w30 h20 vnlv0 Group ggui_update, 0
Gui, Add, Radio, x142 y149 w30 h20 vnlv1 ggui_update, 1
Gui, Add, Radio, x182 y149 w30 h20 vnlv2 ggui_update, 2
Gui, Add, Radio, x222 y149 w30 h20 vnlv3 ggui_update, 3

; file ext config
Gui, Add, Text, x12 y179 w90 h20 , File Extension :
Gui, Add, DropDownList, x102 y179 w50 h20 vconfig_ext r11 ggui_update, .png|.bmp|.jpg||.jp2|.sr|.tif|.hdr|.exr|.ppm|.webp|.tga

; skip file
Gui, Add, CheckBox, x12 y239 w90 h20 vskip_exist Checked ggui_update, Skip Exist File

; mode config
Gui, Add, Text, x12 y209 w40 h20 , Mode :
Gui, Add, DropDownList, x102 y209 w50 h20 vwin_mode r6 ggui_update, |Max|Min|Hide||
Gui, Add, DropDownList, x102 y239 w50 h20 vsleep_time r10 ggui_update, 10|20|50|100||200|333|500|1000
GuiControl,Hide,sleep_time
Gui, Add, Text, x12 y269 w40 h20 , Model :
Gui, Add, DropDownList, x102 y269 w180 h20 vmodel r10 ggui_update, %model_list%

; output scale config
Gui, Add, Radio, x12 y59 w80 h20 Group vby_scale Checked ggui_update, Scale
Gui, Add, Radio, x12 y79 w80 h20 vby_width ggui_update, Width
Gui, Add, Radio, x12 y99 w80 h20 vby_height ggui_update, Height
Gui, Add, Radio, x12 y119 w80 h20 vby_w_h ggui_update, Width*Height
Gui, Add, Edit, x102 y59 w150 h20 vscale ggui_update, %scale%
Gui, Add, Edit, x102 y79 w150 h20 vwidth ggui_update, 
Gui, Add, Edit, x102 y99 w150 h20 vheight ggui_update, 
Gui, Add, Edit, x102 y119 w80 h20 vwidth1 ggui_update, 
Gui, Add, Text, x192 y119 w10 h20, x
Gui, Add, Edit, x202 y119 w80 h20 vheight1 ggui_update, 

; gpu config
Gui, Add, GroupBox, x12 y299 w310 h110 , GPU Setting
Gui, Add, CheckBox, x22 y319 w20 h20 venable_process1 checked ggui_update, 
Gui, Add, Text, x42 y319 w60 h20 vtconfig_gpu1, Process 1 :
Gui, Add, DropDownList, x102 y319 w50 h20 vconfig_gpu1 r8 ggui_update, 0||1|2|3|4|5|6|7
Gui, Add, CheckBox, x22 y339 w20 h20 venable_process2 ggui_update, 
Gui, Add, Text, x42 y339 w60 h20 vtconfig_gpu2, Process 2 :
Gui, Add, DropDownList, x102 y339 w50 h20 vconfig_gpu2 r8 ggui_update, 0||1|2|3|4|5|6|7
Gui, Add, CheckBox, x22 y359 w20 h20 venable_process3 ggui_update, 
Gui, Add, Text, x42 y359 w60 h20 vtconfig_gpu3, Process 3 :
Gui, Add, DropDownList, x102 y359 w50 h20 vconfig_gpu3 r8 ggui_update, 0||1|2|3|4|5|6|7
Gui, Add, CheckBox, x22 y379 w20 h20 venable_process4 ggui_update, 
Gui, Add, Text, x42 y379 w60 h20 vtconfig_gpu4, Process 4 :
Gui, Add, DropDownList, x102 y379 w50 h20 vconfig_gpu4 r8 ggui_update, 0||1|2|3|4|5|6|7
Gui, Add, CheckBox, x172 y319 w20 h20 venable_process5 ggui_update, 
Gui, Add, Text, x192 y319 w60 h20 vtconfig_gpu5, Process 5 :
Gui, Add, DropDownList, x252 y319 w50 h20 vconfig_gpu5 r8 ggui_update, 0||1|2|3|4|5|6|7
Gui, Add, CheckBox, x172 y339 w20 h20 venable_process6 ggui_update, 
Gui, Add, Text, x192 y339 w60 h20 vtconfig_gpu6, Process 6 :
Gui, Add, DropDownList, x252 y339 w50 h20 vconfig_gpu6 r8 ggui_update, 0||1|2|3|4|5|6|7
Gui, Add, CheckBox, x172 y359 w20 h20 venable_process7 ggui_update, 
Gui, Add, Text, x192 y359 w60 h20 vtconfig_gpu7, Process 7 :
Gui, Add, DropDownList, x252 y359 w50 h20 vconfig_gpu7 r8 ggui_update, 0||1|2|3|4|5|6|7
Gui, Add, CheckBox, x172 y379 w20 h20 venable_process8 ggui_update, 
Gui, Add, Text, x192 y379 w60 h20 vtconfig_gpu8, Process 8 :
Gui, Add, DropDownList, x252 y379 w50 h20 vconfig_gpu8 r8 ggui_update, 0||1|2|3|4|5|6|7

; show command
Gui, Add, Edit, x12 y409 w310 h80 -VScroll vl_com, 

; status
Gui, Add, GroupBox, x332 y9 w550 h510 , Status
Gui, Add, Text, x342 y29 w60 h20 , Total Files :
Gui, Add, Text, x432 y29 w70 h20 vf_total, -
Gui, Add, Text, x342 y49 w80 h20 , Processing Files :
Gui, Add, Text, x432 y49 w70 h20 vf_pp, -
Gui, Add, Text, x552 y29 w40 h20 , Speed :
Gui, Add, Text, x602 y29 w60 h20 vtspeed, -
Gui, Add, Text, x672 y29 w50 h20 , fps
Gui, Add, Progress, x342 y69 w530 h10 Border vp_pro, 0

; process status
Gui, Add, Text, x342 y89 w80 h20 , Process 1 :
Gui, Add, Text, x432 y89 w380 h20 vs_file_process1, -
Gui, Add, Text, x822 y89 w50 h20 vs_process_count1, -
Gui, Add, Text, x342 y109 w80 h20 , Process 2 :
Gui, Add, Text, x432 y109 w380 h20 vs_file_process2, -
Gui, Add, Text, x822 y109 w50 h20 vs_process_count2, -
Gui, Add, Text, x342 y129 w80 h20 , Process 3 :
Gui, Add, Text, x432 y129 w380 h20 vs_file_process3, -
Gui, Add, Text, x822 y129 w50 h20 vs_process_count3, -
Gui, Add, Text, x342 y149 w80 h20 , Process 4 :
Gui, Add, Text, x432 y149 w380 h20 vs_file_process4, -
Gui, Add, Text, x822 y149 w50 h20 vs_process_count4, -
Gui, Add, Text, x342 y169 w80 h20 , Process 5 :
Gui, Add, Text, x432 y169 w380 h20 vs_file_process5, -
Gui, Add, Text, x822 y169 w50 h20 vs_process_count5, -
Gui, Add, Text, x342 y189 w80 h20 , Process 6 :
Gui, Add, Text, x432 y189 w380 h20 vs_file_process6, -
Gui, Add, Text, x822 y189 w50 h20 vs_process_count6, -
Gui, Add, Text, x342 y209 w80 h20 , Process 7 :
Gui, Add, Text, x432 y209 w380 h20 vs_file_process7, -
Gui, Add, Text, x822 y209 w50 h20 vs_process_count7, -
Gui, Add, Text, x342 y229 w80 h20 , Process 8 :
Gui, Add, Text, x432 y229 w380 h20 vs_file_process8, -
Gui, Add, Text, x822 y229 w50 h20 vs_process_count8, -

; thumbnail
Gui, Add, Picture, x342 y259 w120 h120 vpic1, 
Gui, Add, Picture, x472 y259 w120 h120 vpic2, 
Gui, Add, Picture, x602 y259 w120 h120 vpic3, 
Gui, Add, Picture, x732 y259 w120 h120 vpic4, 
Gui, Add, Picture, x342 y389 w120 h120 vpic5, 
Gui, Add, Picture, x472 y389 w120 h120 vpic6, 
Gui, Add, Picture, x602 y389 w120 h120 vpic7, 
Gui, Add, Picture, x732 y389 w120 h120 vpic8, 

; button
Gui, Add, Button, x282 y9 w30 h20 gin_folder, ...
Gui, Add, Button, x282 y29 w30 h20 gout_folder, ...
Gui, Add, button, x12 y509 w100 h20 vb_start grun_start, Start
Gui, Add, button, x122 y509 w120 h20 vb_stop grun_stop Disabled, Stop
Gui, Add, button, x252 y509 w70 h20 gsave, Save Setting

Gui, Add, Text, x12 y489 w70 h20 vs_s, Ready ..
Gui, Add, Text, x652 y519 w240 h20 , by pond_pop @ www.facebook.com/Net4Anime


;==== Control ====
GuiControl,,nlv%noise_level%, 1
GuiControl,Hide,mgpu_text
GuiControl, ChooseString, config_ext, %config_ext%


;==== GUI Window ====
Gui, Show, x345 y137 h539 w895, Waifu2x Multi Launcher
goto, gui_update
Return


gui_update:
{
	Gui, Submit, NoHide
	if (nlv0 == 1) 
	noise_level := 0
	else if (nlv1 == 1) 
	noise_level := 1
	else if (nlv2 == 1) 
	noise_level := 2
	else if (nlv3 == 1) 
	noise_level := 3
	
	i:=1
	while(i<=8)
	{
		if (enable_process%i% = 0)
		{
			GuiControl,Hide,pic%i%
		}
		else
		{
			GuiControl,Show,pic%i%
		}
		i++
	}
	

	if(by_scale = 1)
	{
		GuiControl,Enabled,scale
		GuiControl,Disable,width
		GuiControl,Disable,height
		GuiControl,Disable,width1
		GuiControl,Disable,height1
	}
	else if(by_width = 1)
	{
		GuiControl,Disable,scale
		GuiControl,Enabled,width
		GuiControl,Disable,height
		GuiControl,Disable,width1
		GuiControl,Disable,height1
	}
	else if(by_height = 1)
	{
		GuiControl,Disable,scale
		GuiControl,Disable,width
		GuiControl,Enabled,height
		GuiControl,Disable,width1
		GuiControl,Disable,height1
	}
	else if(by_w_h = 1)
	{
		GuiControl,Disable,scale
		GuiControl,Disable,width
		GuiControl,Disable,height
		GuiControl,Enabled,width1
		GuiControl,Enabled,height1
	}

}
return

save:
{
	IniWrite, %in_path%, %A_WorkingDir%\setting.ini, main, in_path
	IniWrite, %out_path%, %A_WorkingDir%\setting.ini, main, out_path
	IniWrite, %noise_level%, %A_WorkingDir%\setting.ini, main, noise_level
	IniWrite, %scale%, %A_WorkingDir%\setting.ini, main, scale
	IniWrite, %win_mode%, %A_WorkingDir%\setting.ini, main, win_mode
	IniWrite, %config_ext%, %A_WorkingDir%\setting.ini, main, config_ext
}
return

in_folder:
{
	Thread, NoTimers
	FileSelectFolder, in_path,, 3
	Thread, NoTimers, false
	GuiControl,,in_path,%in_path%
}
Return

out_folder:
{
	Thread, NoTimers
	FileSelectFolder, out_path,, 3
	Thread, NoTimers, false
	GuiControl,,out_path,%out_path%
}
Return

run_start:
{
	i:=1
	while(i<=8)
	{
		s_process_count%i% := 0
		GuiControl,,s_file_process%i%,-
		GuiControl,,s_process_count%i%,-
		GuiControl,Hide,pic%i%
		i++
	}
	stop := 0
	f_count := 0
	p_count := 0
	p_cycle := 0
	gpu_select := 0
	test_count := 0
	last_files_skiping := 0
	in_len := StrLen(in_path)
	GuiControl,,s_s,Starting..
	GuiControl,,f_total,Scaning..
	GuiControl,,f_pp,0
	GuiControl,,tspeed,-
	GuiControl,Disable,b_start
	GuiControl,Enabled,b_stop
	
	GuiControl,Disable,scale
	GuiControl,Disable,width
	GuiControl,Disable,height
	GuiControl,Disable,width1
	GuiControl,Disable,height1
	
	if(by_scale = 1)
	{
		if scale is alpha
		{
			msgbox, Scale must not alphabetic characters
			stop := 1
		}
		attribute1 := "-s " scale
	}
	else if(by_width = 1)
	{
		if width is alpha
		{
			msgbox, Width must not alphabetic characters
			stop := 1
		}
		attribute1 := "-w " width
	}
	else if(by_height = 1)
	{
		if height is alpha
		{
			msgbox, Height must not alphabetic characters
			stop := 1
		}
		attribute1 := "-h " height
	}
	else
	{
		if width1 is alpha
		{
			msgbox, Width1 must not alphabetic characters
			stop := 1
		}
		if height1 is alpha
		{
			msgbox, Height1 must not alphabetic characters
			stop := 1
		}
		attribute1 := "-w " width1 " -h " height1
	}
	
	Loop, Files, %in_path%\*.*, FR
	{
		if A_LoopFileExt in png,jpg,jpeg,tif,tiff,bmp,tga
		{
			f_count += 1
		}
	}

	if(!model)
	{
		attribute2 := ""
	}
	else
	{
		attribute2 := " --model_dir """ A_WorkingDir "\models\" model """"
	}
	
	GuiControl,,f_total,%f_count%
	
	Loop, Files, %in_path%\*.*, FR
	{
		if A_LoopFileExt in png,bmp,jpg,jp2,sr,tif,hdr,exr,ppm,webp,tga
		{
			if(stop = 1)
			{
				break
			}
			
			StringTrimLeft, sub_dir, A_LoopFileDir, %in_len%
			
			if A_LoopFileExt in webp
			{
				StringTrimRight, out_filename, A_LoopFileName, 5
			}
			else
			{
				StringTrimRight, out_filename, A_LoopFileName, 4
			}
			
			
			p_count += 1
			if skip_exist = 1
			{
				IfExist, %out_path%%sub_dir%\%out_filename%%config_ext%
				{
					last_files_skiping += 1
					if(last_files_skiping = 1)
					{
						GuiControl,,f_pp,Skipping..
					}
					Continue
				}
				else
				{
					last_files_skiping := 0
					GuiControl,,f_pp,%p_count%
				}
			}
			else
			{
				GuiControl,,f_pp,%p_count%
			}

			Loop
			{	
				p_cycle += 1
				If p_cycle > %process_limit%
				{
					Sleep, %sleep_time%
					p_cycle := 1
				}
				
				if(enable_process%p_cycle% = 0)
				{
					continue
				}
				
				
				if(stop = 1)
				{
					break
				}
				process_name := "waifu2x-caffe-cui-p" p_cycle ".exe"
				Process, Exist, %process_name%
				If (!ErrorLevel= 1)
				{
					IfNotExist, %out_path%%sub_dir%
					{
						FileCreateDir, %out_path%%sub_dir%
					}
					gpu_select := config_gpu%p_cycle%

					run_command := """" A_WorkingDir "\waifu2x-caffe-cui-p" p_cycle ".exe"" --gpu " gpu_select " -p cudnn " attribute1 attribute2 " -n " noise_level " -m noise_scale -i """ A_LoopFilePath """ -o """ out_path sub_dir "\" out_filename config_ext """"
					Run, %run_command%, ,%win_mode%
					GuiControl,,l_com,%run_command%
					GuiControl,,s_file_process%p_cycle%,%A_LoopFilePath%
					GuiControl,,pic%p_cycle%,%A_LoopFilePath%
					GuiControl,Show,pic%p_cycle%
					s_process_count%p_cycle% += 1
					dv := s_process_count%p_cycle%
					GuiControl,,s_process_count%p_cycle%,%dv%
					per := (p_count/f_count)*100
					GuiControl,,p_pro,%per%

					test_count += 1
					if (test_count = 1)
					{
						StartTime := A_TickCount
					}
					if test_count <= %process_limit%
					{
						break
					}
					ElapsedTime := A_TickCount - StartTime
					t_sec := ElapsedTime/1000
					speed := (test_count-process_limit)/t_sec
					GuiControl,,tspeed,%speed%
					Break
				}
			}
		}
	}
	GuiControl,,f_pp,%p_count%
	GuiControl,Enabled,b_start
	GuiControl,Disable,b_stop
	
	if(stop = 1)
	{
		GuiControl,,s_s,Stopped
	}
	else
	{
		GuiControl,,s_s,Finished
		per := (p_count/f_count)*100
		GuiControl,,p_pro,%per%
	}
	goto, gui_update
}
return


run_stop:
{
	stop := 1
}
return


guiclose:
exit:
{
	exitapp
}
return
