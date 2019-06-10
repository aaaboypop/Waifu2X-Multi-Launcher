; default setting
in_path := "D:\exp" ; input folder
out_path := "F:\output" ; output folder
noise_level := 3 ; noise level [0-3]
scale := "2.0"
process_limit := 2 ; number of process to run in sametime 
multi_gpu := 0 ; enable multi gpu [0,1]
skip_exist := 1 ; skip exist file [0,1]

Gui, Add, Text, x10 y10, Input Folder :
Gui, Add, Edit, x+10 y+-16 w200 vin_path ggui_update, %in_path%

Gui, Add, Text, x10 y+10, Output Folder :
Gui, Add, Edit, x+10 y+-16 w200 vout_path ggui_update, %out_path%

Gui, Add, Text, x10 y+10, Scale :
Gui, Add, Edit, x+10 y+-16 w200 vscale ggui_update, %scale%

Gui, Add, Text, x10 y+10, Noise Level :
Gui, Add, Radio, x+10 vnlv0 Group ggui_update, 0
Gui, Add, Radio, x+10 vnlv1 ggui_update, 1
Gui, Add, Radio, x+10 vnlv2 ggui_update, 2
Gui, Add, Radio, x+10 vnlv3 Checked ggui_update, 3

Gui, Add, Text, x10 y+10, Parallel Process :
Gui, Add, Radio, x+10 vpp1 Group ggui_update, 1
Gui, Add, Radio, x+10 vpp2 Checked ggui_update, 2
Gui, Add, Radio, x+10 vpp3 ggui_update, 3
Gui, Add, Radio, x+10 vpp4 ggui_update, 4

Gui, Add, CheckBox, x10 y+10 vmulti_gpu ggui_update, MultiGPU
Gui, Add, Text, x+5 vmgpu_text Disabled,Parallel Process must more than 1
GuiControl,Hide,mgpu_text

Gui, Add, CheckBox, x10 y+10 vskip_exist Checked ggui_update, Skip Exist File

gui, add, button, x10 y+20 gshow_setting, Show Setting ..
gui, add, button, x+5 grun_start, Start
gui, add, button, x+5 grun_stop, Stop
Gui, Add, Text, x+76 y+-18 w50 vs_s,

gui, add, button, x10 y+20 h20 w70 gexit, Exit Script

Gui, Add, GroupBox, x300 y0 r11 w490, Status
Gui, Add, Text, x309 y20,Total Files :
Gui, Add, Text, x+10 w80 vf_total,-
Gui, Add, Text, x309 y+10,Processed Files :
Gui, Add, Text, x+10 w80 vf_pp,-

Gui, Add, Text, x309 y+10,Process 1 :
Gui, Add, Text, x+10 w408 vs_pp1,-

Gui, Add, Text, x309 y+10,Process 2 :
Gui, Add, Text, x+10 w408 vs_pp2,-

Gui, Add, Text, x309 y+10,Process 3 :
Gui, Add, Text, x+10 w408 vs_pp3,-

Gui, Add, Text, x309 y+10,Process 4 :
Gui, Add, Text, x+10 w408 vs_pp4,-



gui, show, w800
return

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
   
	if (pp1 == 1) 
	{
		process_limit := 1
		GuiControl,Disabled,multi_gpu
		GuiControl,Show,mgpu_text
		multi_gpu := 0
	}
	else if (pp2 == 1) 
	process_limit := 2
	else if (pp3 == 1) 
	process_limit := 3
	else if (pp4 == 1) 
	process_limit := 4
   
   if (pp1 <> 1)
    {
		GuiControl,Enabled,multi_gpu
		GuiControl,Hide,mgpu_text
    }
}
return

show_setting:
{
	msgbox, Input Folder :: %in_path%`nOutput Folder :: %out_path%`nScale :: %scale%`nMultiGPU :: %multi_gpu%`nNoise Level :: %noise_level%`nParallel Process :: %process_limit%`nSkip Exist File :: %skip_exist%
}
return

run_start:
{
	stop := 0
	f_count := 0
	p_count := 0
	p_cycle := 0
	gpu_s := 0
	in_len := StrLen(in_path)
	GuiControl,,s_pp1,-
	GuiControl,,s_pp2,-
	GuiControl,,s_pp3,-
	GuiControl,,s_pp4,-	
	GuiControl,,s_s,Starting..
	GuiControl,,f_total,Scaning..
	GuiControl,,f_pp,0
	Loop, Files, %in_path%\*.*, FR
	{
		f_count += 1		
	}
	GuiControl,,f_total,%f_count%
	Loop, Files, %in_path%\*.*, FR
	{
		if(stop = 1)
		{
			break
		}
		
		GuiControl,,f_pp,%p_count%
		p_count += 1
		if skip_exist = 1
		{
			IfExist, %out_path%%sub_dir%\%A_LoopFileName%
			{
				GuiControl,,f_pp,Skipping..
				Continue
			}
		}

		Loop
		{	
			p_cycle += 1
			If p_cycle > %process_limit%
			{
				Sleep, 250
				p_cycle := 1
			}
			
			if(stop = 1)
			{
				break
			}
			
			IfWinNotExist, C:\Users\PONDX\Desktop\waifu2x-caffe\waifu2x-caffe-cui-p%p_cycle%.exe
			{
				StringTrimLeft, sub_dir, A_LoopFileDir, %in_len%
				IfNotExist, %out_path%%sub_dir%
				{
					FileCreateDir, %out_path%%sub_dir%
				}
				if multi_gpu = 1
				{
					gpu_s := %p_cycle%-1
				}
				run_command := A_WorkingDir "\waifu2x-caffe-cui-p" p_cycle ".exe -gpu " gpu_s " -p cudnn -s " scale " -n " noise_level " -m noise_scale -i """ A_LoopFilePath """ -o """ out_path sub_dir "\" A_LoopFileName """"
				Run, %run_command%, ,min
				GuiControl,,s_pp%p_cycle%,%A_LoopFilePath%
				Break
			}
		}
	}
	GuiControl,,f_pp,%p_count%
	if(stop = 1)
	{
		GuiControl,,s_s,Stopped
	}
	else
	{
		GuiControl,,s_s,Finished
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
