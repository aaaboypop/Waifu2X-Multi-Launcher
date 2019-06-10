; default setting
in_path := "D:\exp" ; input folder
out_path := "F:\F_DATA\output" ; output folder
noise_level := 2 ; noise level [0-3]
scale := "2.0"

process_limit := 8

Gui, Add, Text, x12 y9 w80 h20 , Input Folder :
Gui, Add, Edit, x102 y9 w210 h20 vin_path ggui_update, %in_path%
Gui, Add, Text, x12 y39 w80 h20 , Output Folder :
Gui, Add, Edit, x102 y39 w210 h20 vout_path ggui_update, %out_path%
Gui, Add, Text, x12 y69 w80 h20 , Scale :
Gui, Add, Edit, x102 y69 w210 h20 vscale ggui_update, %scale%
Gui, Add, Text, x12 y99 w80 h20 , Noise Level :
Gui, Add, Radio, x102 y99 w30 h20 vnlv0 Group ggui_update, 0
Gui, Add, Radio, x142 y99 w30 h20 vnlv1 ggui_update, 1
Gui, Add, Radio, x182 y99 w30 h20 vnlv2 ggui_update, 2
Gui, Add, Radio, x222 y99 w30 h20 vnlv3 ggui_update, 3
Gui, Add, Text, x12 y129 w90 h20 , File Extension :
Gui, Add, DropDownList, x102 y129 w50 h20 vconfig_ext r11 ggui_update, .png|.bmp|.jpg||.jp2|.sr|.tif|.hdr|.exr|.ppm|.webp|.tga
Gui, Add, CheckBox, x12 y159 w90 h20 vskip_exist Checked ggui_update, Skip Exist File
Gui, Add, CheckBox, x12 y179 w180 h20 vs_test ggui_update Checked, Show Speed

Gui, Add, GroupBox, x12 y209 w310 h110 , GPU Setting
Gui, Add, Text, x32 y229 w60 h20 vtconfig_gpu1, Process 1 :
Gui, Add, DropDownList, x92 y229 w50 h20 vconfig_gpu1 r8 ggui_update, 0||1|2|3|4|5|6|7
Gui, Add, Text, x32 y249 w60 h20 vtconfig_gpu2, Process 2 :
Gui, Add, DropDownList, x92 y249 w50 h20 vconfig_gpu2 r8 ggui_update, 0||1|2|3|4|5|6|7
Gui, Add, Text, x32 y269 w60 h20 vtconfig_gpu3, Process 3 :
Gui, Add, DropDownList, x92 y269 w50 h20 vconfig_gpu3 r8 ggui_update, 0||1|2|3|4|5|6|7
Gui, Add, Text, x32 y289 w60 h20 vtconfig_gpu4, Process 4 :
Gui, Add, DropDownList, x92 y289 w50 h20 vconfig_gpu4 r8 ggui_update, 0||1|2|3|4|5|6|7
Gui, Add, Text, x182 y229 w60 h20 vtconfig_gpu5, Process 5 :
Gui, Add, DropDownList, x242 y229 w50 h20 vconfig_gpu5 r8 ggui_update, 0||1|2|3|4|5|6|7
Gui, Add, Text, x182 y249 w60 h20 vtconfig_gpu6, Process 6 :
Gui, Add, DropDownList, x242 y249 w50 h20 vconfig_gpu6 r8 ggui_update, 0||1|2|3|4|5|6|7
Gui, Add, Text, x182 y269 w60 h20 vtconfig_gpu7, Process 7 :
Gui, Add, DropDownList, x242 y269 w50 h20 vconfig_gpu7 r8 ggui_update, 0||1|2|3|4|5|6|7
Gui, Add, Text, x182 y289 w60 h20 vtconfig_gpu8, Process 8 :
Gui, Add, DropDownList, x242 y289 w50 h20 vconfig_gpu8 r8 ggui_update, 0||1|2|3|4|5|6|7

Gui, Add, CheckBox, x12 y227 w20 h20 venable_process1 checked ggui_update, 
Gui, Add, CheckBox, x12 y247 w20 h20 venable_process2 ggui_update, 
Gui, Add, CheckBox, x12 y267 w20 h20 venable_process3 ggui_update, 
Gui, Add, CheckBox, x12 y287 w20 h20 venable_process4 ggui_update, 
Gui, Add, CheckBox, x162 y227 w20 h20 venable_process5 ggui_update, 
Gui, Add, CheckBox, x162 y247 w20 h20 venable_process6 ggui_update, 
Gui, Add, CheckBox, x162 y267 w20 h20 venable_process7 ggui_update, 
Gui, Add, CheckBox, x162 y287 w20 h20 venable_process8 ggui_update, 

Gui, Add, Edit, x12 y319 w310 h80 -VScroll vl_com Disabled,

;==== Status ====
Gui, Add, GroupBox, x332 y9 w550 h510 , Status
Gui, Add, Text, x342 y29 w60 h20 , Total Files :
Gui, Add, Text, x432 y29 w70 h20 vf_total, -
Gui, Add, Text, x342 y49 w80 h20 , Processed Files :
Gui, Add, Text, x432 y49 w70 h20 vf_pp, -

Gui, Add, Text, x552 y29 w40 h20 , Speed :
Gui, Add, Text, x602 y29 w60 h20 vtspeed, -
Gui, Add, Text, x672 y29 w50 h20 , files/sec.

Gui, Add, Progress, x342 y69 w530 h10 Border vp_pro, 0

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

;==== picture ====
Gui, Add, Picture, x342 y259 w120 h120 vpic1, 
Gui, Add, Picture, x472 y259 w120 h120 vpic2, 
Gui, Add, Picture, x602 y259 w120 h120 vpic3, 
Gui, Add, Picture, x732 y259 w120 h120 vpic4, 
Gui, Add, Picture, x342 y389 w120 h120 vpic5,
Gui, Add, Picture, x472 y389 w120 h120 vpic6, 
Gui, Add, Picture, x602 y389 w120 h120 vpic7, 
Gui, Add, Picture, x732 y389 w120 h120 vpic8, 

;==== Button ====
Gui, Add, Text, x12 y409 w70 h20 vs_s, Ready ..
Gui, Add, button, x12 y439 w170 h20 vb_start grun_start, Start
Gui, Add, button, x12 y469 w170 h20 vb_stop grun_stop Disabled, Stop
Gui, Add, button, x12 y509 w100 h20 gexit, Exit

;==== Control ====
GuiControl,,nlv%noise_level%, 1
GuiControl,Disabled,config_gpu3
GuiControl,Disabled,tconfig_gpu3
GuiControl,Disabled,config_gpu4
GuiControl,Disabled,tconfig_gpu4
GuiControl,Disabled,config_gpu5
GuiControl,Disabled,tconfig_gpu5
GuiControl,Disabled,config_gpu6
GuiControl,Disabled,tconfig_gpu6
GuiControl,Disabled,config_gpu7
GuiControl,Disabled,tconfig_gpu7
GuiControl,Disabled,config_gpu8
GuiControl,Disabled,tconfig_gpu8
GuiControl,Hide,mgpu_text
Gui, Submit, NoHide

i:=1
while(i<=8)
{
	if (process_limit < i)
	{
		GuiControl,Disable,config_gpu%i%
		GuiControl,Disable,tconfig_gpu%i%
	}
	else
	{
		GuiControl,Enabled,config_gpu%i%
		GuiControl,Enabled,tconfig_gpu%i%
	}
	i++
}

;==== GUI Window ====
Gui, Show, x345 y137 h539 w895, Waifu2x Multi Launcher
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
	
}
return


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
	
	Loop, Files, %in_path%\*.*, FR
	{
		if A_LoopFileExt in png,jpg,jpeg,tif,tiff,bmp,tga
		{
			f_count += 1
		}
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
					Sleep, 200
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
				
				IfWinNotExist, %A_WorkingDir%\waifu2x-caffe-cui-p%p_cycle%.exe
				{
					IfNotExist, %out_path%%sub_dir%
					{
						FileCreateDir, %out_path%%sub_dir%
					}
					gpu_select := config_gpu%p_cycle%
					
					run_command := """" A_WorkingDir "\waifu2x-caffe-cui-p" p_cycle ".exe "" --gpu " gpu_select " -p cudnn -s " scale " -n " noise_level " -m noise_scale -i """ A_LoopFilePath """ -o """ out_path sub_dir "\" out_filename config_ext """"
					Run, %run_command%, , min
					GuiControl,,l_com,%run_command%
					GuiControl,,s_file_process%p_cycle%,%A_LoopFilePath%
					GuiControl,,pic%p_cycle%,%A_LoopFilePath%
					GuiControl,Show,pic%p_cycle%
					s_process_count%p_cycle% += 1
					dv := s_process_count%p_cycle%
					GuiControl,,s_process_count%p_cycle%,%dv%
					per := (p_count/f_count)*100
					GuiControl,,p_pro,%per%
					if(s_test = 1)
					{
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
					}
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
