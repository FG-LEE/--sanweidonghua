// Made with Amplify Shader Editor v1.9.8
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Hotwater/all_2025_unlit"
{
	Properties
	{
		[Main(g1, _, off, off)]_group_base("基础设置", Float) = 0
		[SubEnum(g1,UnityEngine.Rendering.CullMode)]_cullmodeaaaa("剔除模式", Float) = 0
		[SubEnum(g1,UnityEngine.Rendering.BlendMode)][SubEnum(g1,add,1,blend,10)]_blendmode("混合模式", Float) = 10
		[SubEnum(g1,UnityEngine.Rendering.CompareFunction)]_ztest("深度测试", Float) = 4
		[SubToggle(g1,_)]_zwrite("深度写入", Float) = 0
		[SubEnum(g1,UnityEngine.Rendering.ColorWriteMask)]_colormask("colormask", Float) = 15
		[SubEnum(g1,UnityEngine.Rendering.CompareFunction)]_stencil_comp("stencil_comp", Float) = 0
		[SubEnum(g1,UnityEngine.Rendering.StencilOp)]_stencil_pass("stencil_pass", Float) = 0
		[Sub(g1)]_stencil_reference("stencil_reference", Float) = 0
		[Main(ga7, _, off, off)]_group_color("Color&Ramp", Float) = 0
		[HDR][Sub(ga7)]_color_main("颜色", Color) = (1,1,1,1)
		[Sub(ga7)]_color_scale("整体颜色强度", Float) = 1
		[Sub(ga7)]_Alpha("Alpha", Float) = 1
		[SubToggle(ga7, _)]_AlphaClamp("AlphaClamp", Float) = 1
		[SubToggle(ga7, _)]_vertexcolor_toggle("顶点色", Float) = 1
		[Ramp(ga7)][Advanced(Ramp)][Title(Ramp)]_ramptex("ramptex", 2D) = "white" {}
		[SubToggle(ga7, _)][Advanced(Ramp)]_ramptoggle_rgb("映射颜色", Float) = 0
		[SubToggle(ga7, _)][Advanced(Ramp)]_ramptoggle_a("映射alpha", Float) = 0
		[Sub(ga7)][Advanced(Ramp)]_rampspeed("ramp流动", Float) = 0
		[Main(g2, _, off, off)]_group_maintex("主贴图", Float) = 0
		[Sub(g2)]_maintex("主贴图", 2D) = "white" {}
		[HideInInspector][Sub(g2)]_maintex_ST("_maintex_ST", Vector) = (1,1,0,0)
		[KWEnum(g2,A,_0,R,_1,G,_2,B,_3)]_alpha_maintex("主贴图通道", Float) = 0
		[KWEnum(g2,uv1,_0,uv2,_1,uv_screen,_2)][Advanced(UV)]_uv_maintex("主贴图uv", Float) = 0
		[Sub(g2)][Advanced(UV)]_speed_skew_maintex("主贴图流动&斜切", Vector) = (0,0,0,0)
		[Sub(g2)][Advanced(UV)]_scale_maintex("主贴图中心缩放", Float) = 1
		[SubToggle(g2, _)][Advanced(UV)]_polar_maintex("主贴图极坐标", Float) = 0
		[Sub(g2)][Advanced(UV)]_rotate_maintex("主贴图旋转", Range( -1 , 1)) = 0
		[SubToggle(g2, _)][Advanced(Clamp)]_clampx_maintex("xclamp", Float) = 0
		[SubToggle(g2, _)][Advanced(Clamp)]_clampy_maintex("yclamp", Float) = 0
		[SubToggle(g2, _)][Advanced(posterize)]_posterizetoogle_maintex("开启像素化", Float) = 0
		[Sub(g2)][Advanced(posterize)]_posterize("像素化", Float) = 0
		[Sub(g2)][Advanced(Color)]_desature("去色", Range( 0 , 1)) = 0
		[Sub(g2)][Advanced(Color)]_sesan("色散", Vector) = (0,0,0,0)
		[Sub(g2)][Advanced(Refine)]_refiene_power("refiene_power", Float) = 1
		[Sub(g2)][Advanced(Refine)]_refiene_intensity("refiene_提亮", Float) = 1
		[Sub(g2)][Advanced(Refine)]_refine_lerp("refine_lerp", Range( 0 , 1)) = 0
		[SubToggle(g2, _)][Advanced(Custom)][Helpbox(add uv2)][Helpbox(custom1xyzw)][Helpbox(custom2xyzw)]_customtoogle_mainoffset("custom控制offset", Float) = 0
		[SubKeywordEnumDrawer(g2,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w)][Advanced(Custom)]_custommainx("x轴offset", Float) = 0
		[SubKeywordEnumDrawer(g2,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w)][Advanced(Custom)]_custommainy("y轴offset", Float) = 1
		[Main(g3, _, off, off)]_group_subtex("副贴图", Float) = 0
		[Sub(g3)]_subtex("副贴图", 2D) = "white" {}
		[HideInInspector][Sub(g3)]_subtex_ST("_subtex_ST", Vector) = (1,1,0,0)
		[KWEnum(g3,A,_0,R,_1,G,_2,B,_3)]_alpha_subtex("副贴图通道", Float) = 0
		[KWEnum(g3,uv1,_0,uv2,_1,uv_screen,_2)][Advanced(UV)]_uv_subtex("副贴图uv", Float) = 0
		[Sub(g3)][Advanced(UV)]_speed_skew_subtex("副贴图流动&斜切", Vector) = (0,0,0,0)
		[Sub(g3)][Advanced(UV)]_scale_subtex("副贴图中心缩放", Float) = 1
		[SubToggle(g3, _)][Advanced(UV)]_polar_subtex("副贴图极坐标", Float) = 0
		[Sub(g3)][Advanced(UV)]_rotate_subtex("副贴图旋转", Range( -1 , 1)) = 0
		[SubToggle(g3, _)][Advanced(Clamp)]_clampx_subtex("xclamp", Float) = 0
		[SubToggle(g3, _)][Advanced(Clamp)]_clampy_subtex("yclamp", Float) = 0
		[SubToggle(g3, _)][Advanced(posterize)]_posterizetoogle_subtex("开启像素化", Float) = 0
		[Sub(g3)][Advanced(posterize)]_posterize_subtex("像素化", Float) = 0
		[SubToggle(g3, _)][Advanced(Custom)][Helpbox(add uv2)][Helpbox(custom1xyzw)][Helpbox(custom2xyzw)]_customtoogle_suboffset("custom控制offset", Float) = 0
		[SubKeywordEnumDrawer(g3,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w)][Advanced(Custom)]_customsubx("x轴offset", Float) = 0
		[SubKeywordEnumDrawer(g3,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w)][Advanced(Custom)]_customsuby("y轴offset", Float) = 1
		[SubKeywordEnumDrawer(g3,ColorDodge,LinearDodge,SoftLight,Multiply,Screen,Overlay)][Title(Blend)]_texblendmode("颜色混合模式", Float) = 3
		[Sub(g3)]_blend("混合强度", Range( 0 , 1)) = 1
		[SubKeywordEnumDrawer(g3,main,sub,add,multiply)]_texblendalphaswitch("alpha选择", Float) = 3
		[Main(g4, _, off, off)]_group_mask("Mask", Float) = 0
		[Sub(g4)]_mask("Mask", 2D) = "white" {}
		[HideInInspector][Sub(g4)]_mask_ST("_mask_ST", Vector) = (1,1,0,0)
		[KWEnum(g4,A,_0,R,_1,G,_2,B,_3)]_alpha_mask("Mask通道", Float) = 0
		[KWEnum(g4,uv1,_0,uv2,_1,uv_screen,_2)][Advanced(UV)]_uv_mask("Maskuv", Float) = 0
		[Sub(g4)][Advanced(UV)]_speed_skew_mask("Mask流动&斜切", Vector) = (0,0,0,0)
		[Sub(g4)][Advanced(UV)]_scale_Mask("Mask中心缩放", Float) = 1
		[SubToggle(g4, _)][Advanced(UV)]_polar_mask("Mask极坐标", Float) = 0
		[Sub(g4)][Advanced(UV)]_rotate_mask("Mask旋转", Range( -1 , 1)) = 0
		[SubToggle(g4, _)][Advanced(Clamp)]_clampx_mask("xclamp", Float) = 0
		[SubToggle(g4, _)][Advanced(Clamp)]_clampy_mask("yclamp", Float) = 0
		[SubToggle(g4, _)][Advanced(posterize)]_posterizetoogle_mask("开启像素化", Float) = 0
		[Sub(g4)][Advanced(posterize)]_posterize_mask("像素化", Float) = 0
		[SubToggle(g4, _)][Advanced(Custom)][Helpbox(add uv2)][Helpbox(custom1xyzw)][Helpbox(custom2xyzw)]_customtoogle_maskoffset("custom控制offset", Float) = 0
		[SubKeywordEnumDrawer(g4,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w)][Advanced(Custom)]_custommaskx("x轴offset", Float) = 0
		[SubKeywordEnumDrawer(g4,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w)][Advanced(Custom)]_custommasky("y轴offset", Float) = 1
		[Main(g5, _, off, off)]_group_dis("溶解", Float) = 0
		[Sub(g5)]_dis("溶解贴图", 2D) = "white" {}
		[HideInInspector][Sub(g5)]_dis_ST("_dis_ST", Vector) = (1,1,0,0)
		[KWEnum(g5,A,_0,R,_1,G,_2,B,_3)]_alpha_dis("溶解通道", Float) = 1
		[KWEnum(g5,uv1,_0,uv2,_1,uv_screen,_2)][Advanced(UV)]_uv_dis("溶解uv", Float) = 0
		[Sub(g5)][Advanced(UV)]_speed_skew_dis("溶解流动&斜切", Vector) = (0,0,0,0)
		[Sub(g5)][Advanced(UV)]_scale_dis("溶解中心缩放", Float) = 1
		[SubToggle(g5, _)][Advanced(UV)]_polar_dis("溶解极坐标", Float) = 0
		[Sub(g5)][Advanced(UV)]_rotate_dis("溶解旋转", Range( -1 , 1)) = 0
		[SubToggle(g5, _)][Advanced(Clamp)]_clampx_dis("xclamp", Float) = 0
		[SubToggle(g5, _)][Advanced(Clamp)]_clampy_dis("yclamp", Float) = 0
		[SubToggle(g5, _)][Advanced(posterize)]_posterizetoogle_dis("开启像素化", Float) = 0
		[Sub(g5)][Advanced(posterize)]_posterize_dis("像素化", Float) = 0
		[Ramp(g5)][Advanced(dissolove_direction)]_disdir("溶解方向", 2D) = "white" {}
		[Sub(g5)][Advanced(dissolove_direction)]_disdir_blend("溶解方向混合", Range( 0 , 1)) = 0
		[Sub(g5)][Advanced(dissolove_direction)]_rotate_disdir("溶解方向旋转", Range( -1 , 1)) = 0
		[SubToggle(g5, _)][Advanced(dissolove_direction)]_polar_disdir("溶解方向极坐标", Float) = 0
		[SubToggle(g5, _)][Advanced(Custom)][Helpbox(add uv2)][Helpbox(custom1xyzw)][Helpbox(custom2xyzw)][Title(Offset)]_customtoogle_disoffset("custom控制offset", Float) = 0
		[SubKeywordEnumDrawer(g5,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w)][Advanced(Custom)]_customdisx("x轴offset", Float) = 0
		[SubKeywordEnumDrawer(g5,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w)][Advanced(Custom)]_customdisy("y轴offset", Float) = 1
		[SubToggle(g5, _)][Advanced(Custom)][Title(Dissolove)]_customtoogle_dis("custom控制溶解", Float) = 0
		[SubToggle(g5, _)][Advanced(Custom)]_alphatoogle_dis("粒子alpha控制溶解", Float) = 0
		[SubKeywordEnumDrawer(g5,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w)][Advanced(Custom)]_customdis("溶解", Float) = 4
		[SubToggle(g5, _)][Advanced(Custom)][Title(DissoloveSoft)]_customtoogle_dissoft("custom控制溶解软硬", Float) = 0
		[SubKeywordEnumDrawer(g5,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w)][Advanced(Custom)]_customdissoft("溶解软硬", Float) = 4
		[Sub(g5)][Title(dissolove)]_Float9("溶解软硬", Range( 0 , 0.5)) = 0.5
		[Sub(g5)]_dis_s("溶解", Float) = 0
		[Sub(g5)]_edge("edge", Float) = 0
		[HDR][Sub(g5)]_edgecolor("edgecolor", Color) = (1,1,1,1)
		[Sub(g5)][Advanced(alphaclip)]_dis_clip("clip", Range( 0 , 1)) = 0
		[Main(g6, _, off, off)]_group_noise("扰动", Float) = 0
		[Sub(g6)]_noise("扰动贴图", 2D) = "white" {}
		[HideInInspector][Sub(g6)]_noise_ST("_noise_ST", Vector) = (1,1,0,0)
		[KWEnum(g6,A,_0,R,_1,G,_2,B,_3)]_alpha_noise("扰动通道", Float) = 2
		[KWEnum(g6,uv1,_0,uv2,_1,uv_screen,_2)][Advanced(UV)]_uv_noise("扰动uv", Float) = 0
		[Sub(g6)][Advanced(UV)]_speed_skew_noise("扰动流动&斜切", Vector) = (0,0,0,0)
		[Sub(g6)][Advanced(UV)]_scale_noise("扰动中心缩放", Float) = 1
		[SubToggle(g6, _)][Advanced(UV)]_polar_noise("扰动极坐标", Float) = 0
		[Sub(g6)][Advanced(UV)]_rotate_noise("扰动旋转", Range( -1 , 1)) = 0
		[SubToggle(g6, _)][Advanced(Clamp)]_clampx_noise("xclamp", Float) = 0
		[SubToggle(g6, _)][Advanced(Clamp)]_clampy_noise("yclamp", Float) = 0
		[SubToggle(g6, _)][Advanced(posterize)]_posterizetoogle_noise("开启像素化", Float) = 0
		[Sub(g6)][Advanced(posterize)]_posterize_noise("像素化", Float) = 0
		[SubToggle(g6, _)][Advanced(Custom)][Helpbox(add uv2)][Helpbox(custom1xyzw)][Helpbox(custom2xyzw)][Title(Offset)]_customtoogle_noiseoffset("custom控制offset", Float) = 0
		[SubKeywordEnumDrawer(g6,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w)][Advanced(Custom)]_customnoisex("x轴offset", Float) = 0
		[SubKeywordEnumDrawer(g6,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w)][Advanced(Custom)]_customnoisey("y轴offset", Float) = 1
		[SubToggle(g6, _)][Advanced(Custom)][Title(Noise)]_customtoogle_noisescale("custom控制扰动", Float) = 0
		[SubKeywordEnumDrawer(g6,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w)][Advanced(Custom)]_custom_noises("扰动总强度", Float) = 0
		[Sub(g6)][Title(Noise)]_offset("offset", Float) = 1
		[Sub(g6)]_noise_intensity_main("主贴图扰动强度", Float) = 0
		[Sub(g6)]_noise_intensity_sub("副贴图扰动强度", Float) = 0
		[Sub(g6)]_noise_intensity_mask("mask扰动强度", Float) = 0
		[Sub(g6)]_noise_intensity_dis("溶解扰动强度", Float) = 0
		[KWEnum(g6,Off,_0,On,_1)][Title(Ref)]_toggle_ref("折射/扭曲/热扭曲开关", Float) = 0
		[Sub(g6)]_noise_intensity_screen("屏幕扰动强度", Float) = 0
		[Toggle][SubToggle(g6, _)]_normalnoise_toggle("使用法线扰动屏幕(法线在下面↓)", Float) = 0
		[Main(g7, _, off, off)]_group_noisemask("扰动mask", Float) = 0
		[Sub(g7)]_noisemask("扰动mask", 2D) = "white" {}
		[HideInInspector][Sub(g7)]_noisemask_ST("_noisemask_ST", Vector) = (1,1,0,0)
		[KWEnum(g7,A,_0,R,_1,G,_2,B,_3)]_alpha_noisemask("扰动mask通道", Float) = 2
		[KWEnum(g7,Multiple,_0,Add,_1)]_noisemaskmode("mask模式(相乘/相加)", Float) = 0
		[KWEnum(g7,uv1,_0,uv2,_1,uv_screen,_2)][Advanced(UV)]_uv_noisemask("扰动maskuv", Float) = 0
		[Sub(g7)][Advanced(UV)]_speed_skew_noisemask("扰动mask流动&斜切", Vector) = (0,0,0,0)
		[Sub(g7)][Advanced(UV)]_scale_noisemask("扰动mask中心缩放", Float) = 1
		[SubToggle(g7, _)][Advanced(UV)]_polar_noisemask("扰动mask极坐标", Float) = 0
		[Sub(g7)][Advanced(UV)]_rotate_noisemask("扰动mask旋转", Range( -1 , 1)) = 0
		[SubToggle(g7, _)][Advanced(Clamp)]_clampx_noisemask("xclamp", Float) = 0
		[SubToggle(g7, _)][Advanced(Clamp)]_clampy_noisemask("yclamp", Float) = 0
		[SubToggle(g7, _)][Advanced(posterize)]_posterizetoogle_noisemask("开启像素化", Float) = 0
		[Sub(g7)][Advanced(posterize)]_posterize_noisemask("像素化", Float) = 0
		[SubToggle(g7, _)][Advanced(Custom)][Helpbox(add uv2)][Helpbox(custom1xyzw)][Helpbox(custom2xyzw)][Title(Offset)]_customtoogle_noisemaskoffset("custom控制offset", Float) = 0
		[SubKeywordEnumDrawer(g7,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w)][Advanced(Custom)]_customnoisemaskx("x轴offset", Float) = 0
		[SubKeywordEnumDrawer(g7,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w)][Advanced(Custom)]_customnoisemasky("y轴offset", Float) = 1
		[Main(g8, _, off, off)]_group_vertex("顶点偏移", Float) = 0
		[Sub(g8)]_vertex("顶点偏移贴图", 2D) = "white" {}
		[HideInInspector][Sub(g8)]_vertex_ST("_vertex_ST", Vector) = (1,1,0,0)
		[KWEnum(g8,A,_0,R,_1,G,_2,B,_3)]_alpha_vertex("顶点贴图通道", Float) = 1
		[KWEnum(g8,uv1,_0,uv2,_1,uv_screen,_2)][Advanced(UV)]_uv_vertex("顶点uv", Float) = 0
		[Sub(g8)][Advanced(UV)]_speed_skew_veretx("顶点贴图流动&斜切", Vector) = (0,0,0,0)
		[Sub(g8)][Advanced(UV)]_scale_vertex("顶点贴图中心缩放", Float) = 1
		[SubToggle(g8, _)][Advanced(UV)]_polar_veretx("顶点贴图极坐标", Float) = 0
		[Sub(g8)][Advanced(UV)]_rotate_vertex("顶点贴图旋转", Range( -1 , 1)) = 0
		[SubToggle(g8, _)][Advanced(Clamp)]_clampx_vertex("xclamp", Float) = 0
		[SubToggle(g8, _)][Advanced(Clamp)]_clampy_vertex("yclamp", Float) = 0
		[SubToggle(g8, _)][Advanced(posterize)]_posterizetoogle_vertex("开启像素化", Float) = 0
		[Sub(g8)][Advanced(posterize)]_posterize_vertex("像素化", Float) = 0
		[SubToggle(g8, _)][Advanced(Custom)][Helpbox(add uv2)][Helpbox(custom1xyzw)][Helpbox(custom2xyzw)][Title(Offset)]_customtoogle_vertexoffset("custom控制offset", Float) = 0
		[SubKeywordEnumDrawer(g8,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w)][Advanced(Custom)]_customvertexx("x轴offset", Float) = 0
		[SubKeywordEnumDrawer(g8,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w)][Advanced(Custom)]_customvertexy("y轴offset", Float) = 1
		[SubToggle(g8, _)][Advanced(Custom)][Title(VertexOffset)]_customtoogle_vertexscale("custom控制顶点偏移总强度", Float) = 0
		[SubKeywordEnumDrawer(g8,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w)][Advanced(Custom)]_customvertexscale("顶点偏移总强度", Float) = 0
		[KWEnum(g8,ON,_0,OFF,_1)][Title(VertexOffset)]_toogele_vertexnormal("顶点法线", Float) = 0
		[Sub(g8)]_vertex_remap("remap", Vector) = (0,1,0,1)
		[Sub(g8)]_veretx_intensity("顶点偏移三轴强度", Vector) = (0,0,0,0)
		[Main(g9, _, off, off)]_group_vertexmask("顶点偏移mask", Float) = 0
		[Sub(g9)]_vertexmask("顶点偏移mask贴图", 2D) = "white" {}
		[HideInInspector][Sub(g9)]_vertexmask_ST("_vertexmask_ST", Vector) = (1,1,0,0)
		[KWEnum(g9,A,_0,R,_1,G,_2,B,_3)]_alpha_vertexmask("顶点mask贴图通道", Float) = 1
		[KWEnum(g9,Multiple,_0,Add,_1)]_veretxmaskmode("mask模式(相乘/相加)", Float) = 0
		[Sub(g9)]_vertex_remapmask("remap", Vector) = (0,1,0,1)
		[KWEnum(g9,uv1,_0,uv2,_1,uv_screen,_2)][Advanced(UV)]_uv_vertexmask("顶点maskuv", Float) = 0
		[Sub(g9)][Advanced(UV)]_speed_skew_veretxmask("顶点mask贴图流动&斜切", Vector) = (0,0,0,0)
		[Sub(g9)][Advanced(UV)]_scale_vertexmask("顶点mask中心缩放", Float) = 1
		[SubToggle(g9, _)][Advanced(UV)]_polar_veretxmask("顶点mask贴图极坐标", Float) = 0
		[Sub(g9)][Advanced(UV)]_rotate_vertexmask("顶点mask贴图旋转", Range( -1 , 1)) = 0
		[SubToggle(g9, _)][Advanced(Clamp)]_clampx_vertexmask("xclamp", Float) = 0
		[SubToggle(g9, _)][Advanced(Clamp)]_clampy_vertexmask("yclamp", Float) = 0
		[SubToggle(g9, _)][Advanced(posterize)]_posterizetoogle_vertexmask("开启像素化", Float) = 0
		[Sub(g9)][Advanced(posterize)]_posterize_vertexmask("像素化", Float) = 0
		[SubToggle(g9, _)][Advanced(Custom)][Helpbox(add uv2)][Helpbox(custom1xyzw)][Helpbox(custom2xyzw)][Title(Offset)]_customtoogle_vertexmaskoffset("custom控制offset", Float) = 0
		[SubKeywordEnumDrawer(g9,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w)][Advanced(Custom)]_customvertexmaskx("x轴offset", Float) = 0
		[SubKeywordEnumDrawer(g9,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w)][Advanced(Custom)]_customvertexmasky("y轴offset", Float) = 1
		[Main(ga2, _, off, off)]_group_fresnel("菲尼尔", Float) = 0
		[KWEnum(ga2,Off,_0,On,_1)]_toggle_fresnel("菲尼尔开关", Float) = 0
		[Sub(ga2)]_fresnelpower("菲尼尔power", Float) = 3
		[Sub(ga2)]_fresnelscale("菲尼尔scale", Float) = 1
		[SubToggle(ga2, _)]_invertfresnel("反向菲尼尔", Float) = 0
		[KWEnum(ga2,Multiple,_0,Add,_1)]_fresnelmode("菲尼尔模式(相乘/相加)", Float) = 0
		[HDR][Sub(ga2)]_ColorFresnel("菲尼尔颜色", Color) = (1,1,1,1)
		[Main(ga3, _, off, off)]_group_parallax("视差", Float) = 0
		[KWEnum(ga3,Off,_0,On,_1)]_toggle_parallax("视差开关", Float) = 0
		[NoScaleOffset][Sub(ga3)][Helpbox(custom add tangent)]_parallaxmap("视差贴图(高度图)", 2D) = "white" {}
		[Sub(ga3)]_parallax_scale("视差缩放", Float) = 0
		[HDR][Sub(ga3)]_parallax_outcolor("视差外部颜色", Color) = (0,0,0,1)
		[HDR][Sub(ga3)]_parallax_intcolor("视差内部颜色", Color) = (1,1,1,1)
		[Main(ga4, _, off, off)]_group_depthfade("Depthfade", Float) = 0
		[Sub(ga4)]_Depthfade_distance("羽化距离", Float) = 0
		[SubToggle(ga4, _)]_Depthfadeinvert_toggle("反向", Float) = 0
		[Sub(ga4)]_Depthfade_invertpower("边缘收窄", Float) = 1
		[Sub(ga4)]_Depthfade_invertscale("边缘强度", Float) = 1
		[HDR][Sub(ga4)]_depthcolor("边缘颜色", Color) = (1,1,1,1)
		[Sub(ga4)]_camDepthfade_distance1("相机羽化距离", Float) = 0
		[Sub(ga4)]_camDepthfade_offset("相机羽化偏移", Float) = 0
		[Main(ga5, _, off, off)]_group_normal("法线", Float) = 0
		[Sub(ga5)]_normalmap("法线贴图", 2D) = "white" {}
		[HideInInspector][Sub(ga5)]_normalmap_ST("_normalmap_ST", Vector) = (1,1,0,0)
		[KWEnum(ga5,uv1,_0,uv2,_1,uv_screen,_2)][Advanced(UV)]_uv_normal("法线uv", Float) = 0
		[Sub(ga5)][Advanced(UV)]_speed_skew_normal("normal贴图流动&斜切", Vector) = (0,0,0,0)
		[Sub(ga5)][Advanced(UV)]_scale_normal("normal中心缩放", Float) = 1
		[SubToggle(ga5, _)][Advanced(UV)]_polar_normal("normal贴图极坐标", Float) = 0
		[Sub(ga5)][Advanced(UV)]_rotate_normal("normal贴图旋转", Range( -1 , 1)) = 0
		[SubToggle(ga5, _)][Advanced(Clamp)]_clampx_normal("xclamp", Float) = 0
		[SubToggle(ga5, _)][Advanced(Clamp)]_clampy_normal("yclamp", Float) = 0
		[SubToggle(ga5, _)][Advanced(Custom)][Helpbox(add uv2)][Helpbox(custom1xyzw)][Helpbox(custom2xyzw)][Title(Offset)]_customtoogle_normaloffset("custom控制offset", Float) = 0
		[SubKeywordEnumDrawer(ga5,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w)][Advanced(Custom)]_customnormalx("x轴offset", Float) = 0
		[SubKeywordEnumDrawer(ga5,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w)][Advanced(Custom)]_customnormaly("y轴offset", Float) = 1
		[SubToggle(ga5, _)][Advanced(Custom)][Title(NormalScale)]_customtoogle_normal("custom控制法线强度", Float) = 0
		[SubKeywordEnumDrawer(ga5,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w)][Advanced(Custom)]_customnormal_scale("cuatom法线强度", Float) = 0
		[Sub(ga5)][Title(NormalScale)]_noraml_scale("法线强度", Float) = 0
		[SubToggle(ga5, _)][Title(Lighting)]_Float19("npr", Float) = 0
		[Sub(ga5)]_shadowsoft("阴影软硬", Range( 0 , 1)) = 0
		[Sub(ga5)]_shadowarea("阴影范围", Range( -1 , 1)) = 0
		[Sub(ga5)]_shadow_intensity("阴影强度", Range( 0 , 1)) = 0.5
		[Sub(ga5)]_lightarea("高光范围", Range( -1 , 1)) = -0.8
		[Sub(ga5)]_lightsoft("高光软硬", Range( 0 , 1)) = 0
		[Sub(ga5)]_lightscale("高光强度", Float) = 0.5
		[Main(ga1, _, off, off)]_group_matcap("反射", Float) = 0
		[KWEnum(ga1,Off,_0,On,_1)]_toggle_matcao("反射开关", Float) = 0
		[Sub(ga1)][Title(Matcap)]_Matcap("Matcap", 2D) = "white" {}
		[Sub(ga1)]_matcapdesature("matcap去色", Range( 0 , 1)) = 0
		[Sub(ga1)]_matcap_scale("matcap强度", Float) = 0
		[NoScaleOffset][Sub(ga1)][Title(Cubemap)]_Cubemap("Cubemap", CUBE) = "white" {}
		[Sub(ga1)]_cube_scale("cube强度", Float) = 0
		[Main(ga6, _, off, off)]_group_flowmap("Flowmap", Float) = 0
		[Sub(ga6)][Helpbox(Uncheck the sRGB option for the texture)]_flowmap("flowmaptex", 2D) = "white" {}
		[Sub(ga6)]_flowmap_intensity("flowmap强度", Range( 0 , 1)) = 0
		[SubToggle(ga6, _)][Advanced(toggle)]_flowmaptoggle_main("主贴图flowmap", Float) = 0
		[SubToggle(ga6, _)][Advanced(toggle)]_flowmaptoggle_sub("副贴图flowmap", Float) = 0
		[SubToggle(ga6, _)][Advanced(toggle)]_flowmaptoggle_mask("Maskflowmap", Float) = 0
		[SubToggle(ga6, _)][Advanced(toggle)]_flowmaptoggle_dis("溶解flowmap", Float) = 0
		[SubToggle(ga6, _)][Advanced(toggle)]_flowmaptoggle_disdir("溶解方向flowmap", Float) = 0
		[SubToggle(ga6, _)][Advanced(toggle)]_flowmaptoggle_noise("Noiseflowmap", Float) = 0
		[SubToggle(ga6, _)][Advanced(toggle)]_flowmaptoggle_noisemask("NoiseMaskflowmap", Float) = 0
		[SubToggle(ga6, _)][Advanced(Custom)][Title(VertexOffset)]_customtoogle_flowmap("custom控制flowmap", Float) = 0
		[SubKeywordEnumDrawer(ga6,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w)][Advanced(Custom)]_customflowmap("flowmap强度", Float) = 0
		[KWEnum(ga6,Off,_0,On,_1)][Title(LoopFlow)]_toogele_loopflow("Loopflow开关", Float) = 0
		[Sub(ga6)]_loopflow_strength("strength", Float) = 0.3
		[Sub(ga6)]_loopflow_speed("speed", Float) = 0.3
		[HideInInspector] _texcoord( "", 2D ) = "white" {}

	}
	
	SubShader
	{
		
		
		Tags { "RenderType"="Opaque" "Queue"="Transparent" }
	LOD 100

		CGINCLUDE
		#pragma target 4.5
		ENDCG
		Blend SrcAlpha [_blendmode]
		AlphaToMask Off
		Cull [_cullmodeaaaa]
		ColorMask [_colormask]
		ZWrite [_zwrite]
		ZTest [_ztest]
		Offset -1 , -1
		Stencil
		{
			Ref [_stencil_reference]
			Comp [_stencil_comp]
			Pass [_stencil_pass]
			Fail Keep
			ZFail Keep
		}
		
		GrabPass{ }

		Pass
		{
			Name "Unlit"

			CGPROGRAM

			#define ASE_VERSION 19800
			#if defined(UNITY_STEREO_INSTANCING_ENABLED) || defined(UNITY_STEREO_MULTIVIEW_ENABLED)
			#define ASE_DECLARE_SCREENSPACE_TEXTURE(tex) UNITY_DECLARE_SCREENSPACE_TEXTURE(tex);
			#else
			#define ASE_DECLARE_SCREENSPACE_TEXTURE(tex) UNITY_DECLARE_SCREENSPACE_TEXTURE(tex)
			#endif


			#ifndef UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX
			//only defining to not throw compilation error over Unity 5.5
			#define UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input)
			#endif
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_instancing
			#include "UnityCG.cginc"
			#include "UnityShaderVariables.cginc"
			#include "UnityStandardUtils.cginc"
			#include "Lighting.cginc"
			#include "AutoLight.cginc"
			#include "UnityStandardBRDF.cginc"
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_COLOR


			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			
			struct v2f
			{
				float4 vertex : SV_POSITION;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 worldPos : TEXCOORD0;
				#endif
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			//This is a late directive
			
			uniform float _group_maintex;
			uniform float _stencil_reference;
			uniform float _stencil_comp;
			uniform float _stencil_pass;
			uniform float _group_subtex;
			uniform float _group_mask;
			uniform float _group_dis;
			uniform float _group_noise;
			uniform float _group_base;
			uniform float _group_vertex;
			uniform float _group_noisemask;
			uniform float _group_vertexmask;
			uniform float _group_matcap;
			uniform float _group_parallax;
			uniform float _blendmode;
			uniform float _ztest;
			uniform float _zwrite;
			uniform float _cullmodeaaaa;
			uniform float _colormask;
			uniform float _group_depthfade;
			uniform float _group_flowmap;
			uniform float _group_color;
			uniform float _group_fresnel;
			uniform float _group_normal;
			uniform sampler2D _vertex;
			uniform float4 _speed_skew_veretx;
			uniform float _uv_vertex;
			uniform float _polar_veretx;
			uniform float _rotate_vertex;
			uniform float _scale_vertex;
			uniform float4 _vertex_ST;
			uniform float _customvertexx;
			uniform float _customvertexy;
			uniform float _customtoogle_vertexoffset;
			uniform float _clampx_vertex;
			uniform float _clampy_vertex;
			uniform float _posterize_vertex;
			uniform float _posterizetoogle_vertex;
			uniform float _alpha_vertex;
			uniform float4 _vertex_remap;
			uniform sampler2D _vertexmask;
			uniform float4 _speed_skew_veretxmask;
			uniform float _uv_vertexmask;
			uniform float _polar_veretxmask;
			uniform float _rotate_vertexmask;
			uniform float _scale_vertexmask;
			uniform float4 _vertexmask_ST;
			uniform float _customvertexmaskx;
			uniform float _customvertexmasky;
			uniform float _customtoogle_vertexmaskoffset;
			uniform float _clampx_vertexmask;
			uniform float _clampy_vertexmask;
			uniform float _posterize_vertexmask;
			uniform float _posterizetoogle_vertexmask;
			uniform float _alpha_vertexmask;
			uniform float4 _vertex_remapmask;
			uniform float _veretxmaskmode;
			uniform float _toogele_vertexnormal;
			uniform float3 _veretx_intensity;
			uniform float _customvertexscale;
			uniform float _customtoogle_vertexscale;
			uniform float _color_scale;
			uniform sampler2D _Matcap;
			uniform sampler2D _normalmap;
			uniform float4 _speed_skew_normal;
			uniform float _uv_normal;
			uniform float _polar_normal;
			uniform float _rotate_normal;
			uniform float _scale_normal;
			uniform float4 _normalmap_ST;
			uniform float _customnormalx;
			uniform float _customnormaly;
			uniform float _customtoogle_normaloffset;
			uniform float _clampx_normal;
			uniform float _clampy_normal;
			uniform float _noraml_scale;
			uniform float _customnormal_scale;
			uniform float _customtoogle_normal;
			uniform float _matcapdesature;
			uniform float _matcap_scale;
			uniform samplerCUBE _Cubemap;
			uniform float _cube_scale;
			uniform float _toggle_matcao;
			uniform float _Depthfade_invertscale;
			uniform float _camDepthfade_distance1;
			uniform float _camDepthfade_offset;
			UNITY_DECLARE_DEPTH_TEXTURE( _CameraDepthTexture );
			uniform float4 _CameraDepthTexture_TexelSize;
			uniform float _Depthfade_distance;
			uniform float _Depthfadeinvert_toggle;
			uniform float _Depthfade_invertpower;
			uniform float4 _depthcolor;
			uniform float4 _color_main;
			uniform float _shadow_intensity;
			uniform float _shadowarea;
			uniform float _shadowsoft;
			uniform float _lightarea;
			uniform float _lightsoft;
			uniform float _lightscale;
			uniform float _Float19;
			uniform sampler2D _subtex;
			uniform float4 _speed_skew_subtex;
			uniform float _uv_subtex;
			uniform sampler2D _flowmap;
			uniform float4 _flowmap_ST;
			uniform float _flowmap_intensity;
			uniform float _customflowmap;
			uniform float _customtoogle_flowmap;
			uniform float _flowmaptoggle_sub;
			uniform float _polar_subtex;
			uniform float _rotate_subtex;
			uniform float _scale_subtex;
			uniform float4 _subtex_ST;
			uniform float _customsubx;
			uniform float _customsuby;
			uniform float _customtoogle_suboffset;
			uniform float _clampx_subtex;
			uniform float _clampy_subtex;
			uniform float _posterize_subtex;
			uniform float _posterizetoogle_subtex;
			uniform sampler2D _noise;
			uniform float4 _speed_skew_noise;
			uniform float _uv_noise;
			uniform float _flowmaptoggle_noise;
			uniform float _polar_noise;
			uniform float _rotate_noise;
			uniform float _scale_noise;
			uniform float4 _noise_ST;
			uniform float _customnoisex;
			uniform float _customnoisey;
			uniform float _customtoogle_noiseoffset;
			uniform float _clampx_noise;
			uniform float _clampy_noise;
			uniform float _posterize_noise;
			uniform float _posterizetoogle_noise;
			uniform float _offset;
			uniform float _alpha_noise;
			uniform sampler2D _noisemask;
			uniform float4 _speed_skew_noisemask;
			uniform float _uv_noisemask;
			uniform float _flowmaptoggle_noisemask;
			uniform float _polar_noisemask;
			uniform float _rotate_noisemask;
			uniform float _scale_noisemask;
			uniform float4 _noisemask_ST;
			uniform float _customnoisemaskx;
			uniform float _customnoisemasky;
			uniform float _customtoogle_noisemaskoffset;
			uniform float _clampx_noisemask;
			uniform float _clampy_noisemask;
			uniform float _posterize_noisemask;
			uniform float _posterizetoogle_noisemask;
			uniform float _alpha_noisemask;
			uniform float _noisemaskmode;
			uniform float _noise_intensity_sub;
			uniform float _custom_noises;
			uniform float _customtoogle_noisescale;
			uniform sampler2D _maintex;
			uniform float4 _speed_skew_maintex;
			uniform float _uv_maintex;
			uniform float _flowmaptoggle_main;
			uniform float _polar_maintex;
			uniform float _rotate_maintex;
			uniform float _scale_maintex;
			uniform float4 _maintex_ST;
			uniform float _custommainx;
			uniform float _custommainy;
			uniform float _customtoogle_mainoffset;
			uniform float _clampx_maintex;
			uniform float _clampy_maintex;
			uniform float _posterize;
			uniform float _posterizetoogle_maintex;
			uniform sampler2D _parallaxmap;
			uniform float _parallax_scale;
			uniform float4 _parallaxmap_ST;
			uniform float _toggle_parallax;
			uniform float _noise_intensity_main;
			uniform float2 _sesan;
			uniform float _loopflow_speed;
			uniform float _loopflow_strength;
			uniform float _toogele_loopflow;
			uniform float _desature;
			uniform float _refiene_power;
			uniform float _refiene_intensity;
			uniform float _refine_lerp;
			uniform float4 _parallax_outcolor;
			uniform float4 _parallax_intcolor;
			uniform float _alpha_maintex;
			uniform float _blend;
			uniform float _texblendmode;
			uniform sampler2D _ramptex;
			uniform float _rampspeed;
			uniform float _alpha_subtex;
			uniform float _texblendalphaswitch;
			uniform float _invertfresnel;
			uniform float _fresnelpower;
			uniform float _fresnelscale;
			uniform float _fresnelmode;
			uniform float _toggle_fresnel;
			uniform sampler2D _mask;
			uniform float4 _speed_skew_mask;
			uniform float _uv_mask;
			uniform float _flowmaptoggle_mask;
			uniform float _polar_mask;
			uniform float _rotate_mask;
			uniform float _scale_Mask;
			uniform float4 _mask_ST;
			uniform float _custommaskx;
			uniform float _custommasky;
			uniform float _customtoogle_maskoffset;
			uniform float _clampx_mask;
			uniform float _clampy_mask;
			uniform float _posterize_mask;
			uniform float _posterizetoogle_mask;
			uniform float _noise_intensity_mask;
			uniform float _alpha_mask;
			uniform float _Float9;
			uniform float _customdissoft;
			uniform float _customtoogle_dissoft;
			uniform sampler2D _dis;
			uniform float4 _speed_skew_dis;
			uniform float _uv_dis;
			uniform float _flowmaptoggle_dis;
			uniform float _polar_dis;
			uniform float _rotate_dis;
			uniform float _scale_dis;
			uniform float4 _dis_ST;
			uniform float _customdisx;
			uniform float _customdisy;
			uniform float _customtoogle_disoffset;
			uniform float _clampx_dis;
			uniform float _clampy_dis;
			uniform float _posterize_dis;
			uniform float _posterizetoogle_dis;
			uniform float _noise_intensity_dis;
			uniform float _alpha_dis;
			uniform sampler2D _disdir;
			uniform float _flowmaptoggle_disdir;
			uniform float _polar_disdir;
			uniform float _rotate_disdir;
			uniform float _disdir_blend;
			uniform float _dis_s;
			uniform float _customdis;
			uniform float _customtoogle_dis;
			uniform float _alphatoogle_dis;
			uniform float _Alpha;
			uniform float _vertexcolor_toggle;
			uniform float _ramptoggle_rgb;
			uniform float4 _ColorFresnel;
			uniform float4 _edgecolor;
			uniform float _edge;
			uniform float _dis_clip;
			ASE_DECLARE_SCREENSPACE_TEXTURE( _GrabTexture )
			uniform float _noise_intensity_screen;
			uniform float _normalnoise_toggle;
			uniform float _toggle_ref;
			uniform float _ramptoggle_a;
			uniform float _AlphaClamp;
			inline float4 ASE_ComputeGrabScreenPos( float4 pos )
			{
				#if UNITY_UV_STARTS_AT_TOP
				float scale = -1.0;
				#else
				float scale = 1.0;
				#endif
				float4 o = pos;
				o.y = pos.w * 0.5f;
				o.y = ( pos.y - o.y ) * _ProjectionParams.x * scale + o.y;
				return o;
			}
			
			inline float2 POM( sampler2D heightMap, float2 uvs, float2 dx, float2 dy, float3 normalWorld, float3 viewWorld, float3 viewDirTan, int minSamples, int maxSamples, int sidewallSteps, float parallax, float refPlane, float2 tilling, float2 curv, int index )
			{
				float3 result = 0;
				float stepIndex = 0;
				float numSteps = floor( lerp( (float)maxSamples, (float)minSamples, saturate( dot( normalWorld, viewWorld ) ) ) );
				float layerHeight = 1.0 / numSteps;
				float2 plane = parallax * ( viewDirTan.xy / viewDirTan.z );
				uvs.xy += refPlane * plane;
				float2 deltaTex = -plane * layerHeight;
				float2 prevTexOffset = 0;
				float prevRayZ = 1.0f;
				float prevHeight = 0.0f;
				float2 currTexOffset = deltaTex;
				float currRayZ = 1.0f - layerHeight;
				float currHeight = 0.0f;
				float intersection = 0;
				float2 finalTexOffset = 0;
				while ( stepIndex < numSteps + 1 )
				{
				 	currHeight = tex2Dgrad( heightMap, uvs + currTexOffset, dx, dy ).r;
				 	if ( currHeight > currRayZ )
				 	{
				 	 	stepIndex = numSteps + 1;
				 	}
				 	else
				 	{
				 	 	stepIndex++;
				 	 	prevTexOffset = currTexOffset;
				 	 	prevRayZ = currRayZ;
				 	 	prevHeight = currHeight;
				 	 	currTexOffset += deltaTex;
				 	 	currRayZ -= layerHeight;
				 	}
				}
				float sectionSteps = sidewallSteps;
				float sectionIndex = 0;
				float newZ = 0;
				float newHeight = 0;
				while ( sectionIndex < sectionSteps )
				{
				 	intersection = ( prevHeight - prevRayZ ) / ( prevHeight - currHeight + currRayZ - prevRayZ );
				 	finalTexOffset = prevTexOffset + intersection * deltaTex;
				 	newZ = prevRayZ - intersection * layerHeight;
				 	newHeight = tex2Dgrad( heightMap, uvs + finalTexOffset, dx, dy ).r;
				 	if ( newHeight > newZ )
				 	{
				 	 	currTexOffset = finalTexOffset;
				 	 	currHeight = newHeight;
				 	 	currRayZ = newZ;
				 	 	deltaTex = intersection * deltaTex;
				 	 	layerHeight = intersection * layerHeight;
				 	}
				 	else
				 	{
				 	 	prevTexOffset = finalTexOffset;
				 	 	prevHeight = newHeight;
				 	 	prevRayZ = newZ;
				 	 	deltaTex = ( 1 - intersection ) * deltaTex;
				 	 	layerHeight = ( 1 - intersection ) * layerHeight;
				 	}
				 	sectionIndex++;
				}
				return uvs.xy + finalTexOffset;
			}
			

			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				float2 appendResult511 = (float2(_speed_skew_veretx.x , _speed_skew_veretx.y));
				float2 lerpResult501 = lerp( v.ase_texcoord.xy , v.ase_texcoord1.xy , _uv_vertex);
				float4 ase_positionCS = UnityObjectToClipPos(v.vertex);
				float4 screenPos = ComputeScreenPos(ase_positionCS);
				float4 ase_grabScreenPos = ASE_ComputeGrabScreenPos( screenPos );
				float4 ase_grabScreenPosNorm = ase_grabScreenPos / ase_grabScreenPos.w;
				float2 appendResult505 = (float2(ase_grabScreenPosNorm.r , ase_grabScreenPosNorm.g));
				float2 lerpResult508 = lerp( lerpResult501 , appendResult505 , saturate( ( _uv_vertex - 1.0 ) ));
				float2 temp_output_51_0_g399 = lerpResult508;
				float2 temp_output_34_0_g400 = ( temp_output_51_0_g399 - float2( 0.5,0.5 ) );
				float2 break39_g400 = temp_output_34_0_g400;
				float2 appendResult50_g400 = (float2(( 1.0 * ( length( temp_output_34_0_g400 ) * 2.0 ) ) , ( ( atan2( break39_g400.x , break39_g400.y ) * ( 1.0 / 6.28318548202515 ) ) * 1.0 )));
				float2 lerpResult14_g399 = lerp( temp_output_51_0_g399 , appendResult50_g400 , _polar_veretx);
				float3 appendResult11_g399 = (float3(1.0 , _speed_skew_veretx.z , 0.0));
				float3 appendResult9_g399 = (float3(_speed_skew_veretx.w , 1.0 , 0.0));
				float2 temp_cast_2 = (0.5).xx;
				float cos18_g399 = cos( ( _rotate_vertex * UNITY_PI ) );
				float sin18_g399 = sin( ( _rotate_vertex * UNITY_PI ) );
				float2 rotator18_g399 = mul( mul( float3( lerpResult14_g399 ,  0.0 ), float3x3(appendResult11_g399, appendResult9_g399, float3(0,0,1)) ).xy - temp_cast_2 , float2x2( cos18_g399 , -sin18_g399 , sin18_g399 , cos18_g399 )) + temp_cast_2;
				float2 panner20_g399 = ( 1.0 * _Time.y * appendResult511 + rotator18_g399);
				float2 temp_cast_3 = (0.5).xx;
				float2 appendResult509 = (float2(_vertex_ST.x , _vertex_ST.y));
				float2 appendResult502 = (float2(_vertex_ST.z , _vertex_ST.w));
				float4 texCoord1_g396 = v.ase_texcoord1;
				texCoord1_g396.xy = v.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_5_0_g396 = _customvertexx;
				float lerpResult2_g396 = lerp( texCoord1_g396.x , texCoord1_g396.y , temp_output_5_0_g396);
				float lerpResult6_g396 = lerp( lerpResult2_g396 , texCoord1_g396.z , saturate( ( temp_output_5_0_g396 - 1.0 ) ));
				float lerpResult11_g396 = lerp( lerpResult6_g396 , texCoord1_g396.w , saturate( ( temp_output_5_0_g396 - 2.0 ) ));
				float4 texCoord15_g396 = v.ase_texcoord2;
				texCoord15_g396.xy = v.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult13_g396 = lerp( lerpResult11_g396 , texCoord15_g396.x , saturate( ( temp_output_5_0_g396 - 3.0 ) ));
				float lerpResult17_g396 = lerp( lerpResult13_g396 , texCoord15_g396.y , saturate( ( temp_output_5_0_g396 - 4.0 ) ));
				float lerpResult20_g396 = lerp( lerpResult17_g396 , texCoord15_g396.z , saturate( ( temp_output_5_0_g396 - 5.0 ) ));
				float lerpResult23_g396 = lerp( lerpResult20_g396 , texCoord15_g396.w , saturate( ( temp_output_5_0_g396 - 6.0 ) ));
				float4 texCoord1_g395 = v.ase_texcoord1;
				texCoord1_g395.xy = v.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_5_0_g395 = _customvertexy;
				float lerpResult2_g395 = lerp( texCoord1_g395.x , texCoord1_g395.y , temp_output_5_0_g395);
				float lerpResult6_g395 = lerp( lerpResult2_g395 , texCoord1_g395.z , saturate( ( temp_output_5_0_g395 - 1.0 ) ));
				float lerpResult11_g395 = lerp( lerpResult6_g395 , texCoord1_g395.w , saturate( ( temp_output_5_0_g395 - 2.0 ) ));
				float4 texCoord15_g395 = v.ase_texcoord2;
				texCoord15_g395.xy = v.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult13_g395 = lerp( lerpResult11_g395 , texCoord15_g395.x , saturate( ( temp_output_5_0_g395 - 3.0 ) ));
				float lerpResult17_g395 = lerp( lerpResult13_g395 , texCoord15_g395.y , saturate( ( temp_output_5_0_g395 - 4.0 ) ));
				float lerpResult20_g395 = lerp( lerpResult17_g395 , texCoord15_g395.z , saturate( ( temp_output_5_0_g395 - 5.0 ) ));
				float lerpResult23_g395 = lerp( lerpResult20_g395 , texCoord15_g395.w , saturate( ( temp_output_5_0_g395 - 6.0 ) ));
				float2 appendResult503 = (float2(lerpResult23_g396 , lerpResult23_g395));
				float2 lerpResult510 = lerp( appendResult502 , appendResult503 , _customtoogle_vertexoffset);
				float2 break54_g399 = (( ( ( panner20_g399 - temp_cast_3 ) * _scale_vertex ) + 0.5 )*appendResult509 + lerpResult510);
				float clampResult55_g399 = clamp( break54_g399.x , 0.0 , 1.0 );
				float lerpResult58_g399 = lerp( break54_g399.x , clampResult55_g399 , _clampx_vertex);
				float clampResult56_g399 = clamp( break54_g399.y , 0.0 , 1.0 );
				float lerpResult59_g399 = lerp( break54_g399.y , clampResult56_g399 , _clampy_vertex);
				float2 appendResult57_g399 = (float2(lerpResult58_g399 , lerpResult59_g399));
				float div68_g399=256.0/float((int)( 1.0 + _posterize_vertex ));
				float4 posterize68_g399 = ( floor( float4( (appendResult57_g399).xy, 0.0 , 0.0 ) * div68_g399 ) / div68_g399 );
				float2 lerpResult67_g399 = lerp( appendResult57_g399 , (posterize68_g399).rg , _posterizetoogle_vertex);
				float4 tex2DNode523 = tex2Dlod( _vertex, float4( lerpResult67_g399, 0, 0.0) );
				float temp_output_79_0_g410 = _alpha_vertex;
				float lerpResult64_g410 = lerp( tex2DNode523.a , tex2DNode523.r , temp_output_79_0_g410);
				float clampResult68_g410 = clamp( ( temp_output_79_0_g410 - 1.0 ) , 0.0 , 1.0 );
				float lerpResult66_g410 = lerp( lerpResult64_g410 , tex2DNode523.g , clampResult68_g410);
				float clampResult70_g410 = clamp( ( temp_output_79_0_g410 - 2.0 ) , 0.0 , 1.0 );
				float lerpResult69_g410 = lerp( lerpResult66_g410 , tex2DNode523.b , clampResult70_g410);
				float temp_output_525_0 = (_vertex_remap.z + (lerpResult69_g410 - _vertex_remap.x) * (_vertex_remap.w - _vertex_remap.z) / (_vertex_remap.y - _vertex_remap.x));
				float2 appendResult590 = (float2(_speed_skew_veretxmask.x , _speed_skew_veretxmask.y));
				float2 lerpResult578 = lerp( v.ase_texcoord.xy , v.ase_texcoord1.xy , _uv_vertexmask);
				float2 appendResult582 = (float2(ase_grabScreenPosNorm.r , ase_grabScreenPosNorm.g));
				float2 lerpResult585 = lerp( lerpResult578 , appendResult582 , saturate( ( _uv_vertexmask - 1.0 ) ));
				float2 temp_output_51_0_g408 = lerpResult585;
				float2 temp_output_34_0_g409 = ( temp_output_51_0_g408 - float2( 0.5,0.5 ) );
				float2 break39_g409 = temp_output_34_0_g409;
				float2 appendResult50_g409 = (float2(( 1.0 * ( length( temp_output_34_0_g409 ) * 2.0 ) ) , ( ( atan2( break39_g409.x , break39_g409.y ) * ( 1.0 / 6.28318548202515 ) ) * 1.0 )));
				float2 lerpResult14_g408 = lerp( temp_output_51_0_g408 , appendResult50_g409 , _polar_veretxmask);
				float3 appendResult11_g408 = (float3(1.0 , _speed_skew_veretxmask.z , 0.0));
				float3 appendResult9_g408 = (float3(_speed_skew_veretxmask.w , 1.0 , 0.0));
				float2 temp_cast_8 = (0.5).xx;
				float cos18_g408 = cos( ( _rotate_vertexmask * UNITY_PI ) );
				float sin18_g408 = sin( ( _rotate_vertexmask * UNITY_PI ) );
				float2 rotator18_g408 = mul( mul( float3( lerpResult14_g408 ,  0.0 ), float3x3(appendResult11_g408, appendResult9_g408, float3(0,0,1)) ).xy - temp_cast_8 , float2x2( cos18_g408 , -sin18_g408 , sin18_g408 , cos18_g408 )) + temp_cast_8;
				float2 panner20_g408 = ( 1.0 * _Time.y * appendResult590 + rotator18_g408);
				float2 temp_cast_9 = (0.5).xx;
				float2 appendResult586 = (float2(_vertexmask_ST.x , _vertexmask_ST.y));
				float2 appendResult579 = (float2(_vertexmask_ST.z , _vertexmask_ST.w));
				float4 texCoord1_g398 = v.ase_texcoord1;
				texCoord1_g398.xy = v.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_5_0_g398 = _customvertexmaskx;
				float lerpResult2_g398 = lerp( texCoord1_g398.x , texCoord1_g398.y , temp_output_5_0_g398);
				float lerpResult6_g398 = lerp( lerpResult2_g398 , texCoord1_g398.z , saturate( ( temp_output_5_0_g398 - 1.0 ) ));
				float lerpResult11_g398 = lerp( lerpResult6_g398 , texCoord1_g398.w , saturate( ( temp_output_5_0_g398 - 2.0 ) ));
				float4 texCoord15_g398 = v.ase_texcoord2;
				texCoord15_g398.xy = v.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult13_g398 = lerp( lerpResult11_g398 , texCoord15_g398.x , saturate( ( temp_output_5_0_g398 - 3.0 ) ));
				float lerpResult17_g398 = lerp( lerpResult13_g398 , texCoord15_g398.y , saturate( ( temp_output_5_0_g398 - 4.0 ) ));
				float lerpResult20_g398 = lerp( lerpResult17_g398 , texCoord15_g398.z , saturate( ( temp_output_5_0_g398 - 5.0 ) ));
				float lerpResult23_g398 = lerp( lerpResult20_g398 , texCoord15_g398.w , saturate( ( temp_output_5_0_g398 - 6.0 ) ));
				float4 texCoord1_g397 = v.ase_texcoord1;
				texCoord1_g397.xy = v.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_5_0_g397 = _customvertexmasky;
				float lerpResult2_g397 = lerp( texCoord1_g397.x , texCoord1_g397.y , temp_output_5_0_g397);
				float lerpResult6_g397 = lerp( lerpResult2_g397 , texCoord1_g397.z , saturate( ( temp_output_5_0_g397 - 1.0 ) ));
				float lerpResult11_g397 = lerp( lerpResult6_g397 , texCoord1_g397.w , saturate( ( temp_output_5_0_g397 - 2.0 ) ));
				float4 texCoord15_g397 = v.ase_texcoord2;
				texCoord15_g397.xy = v.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult13_g397 = lerp( lerpResult11_g397 , texCoord15_g397.x , saturate( ( temp_output_5_0_g397 - 3.0 ) ));
				float lerpResult17_g397 = lerp( lerpResult13_g397 , texCoord15_g397.y , saturate( ( temp_output_5_0_g397 - 4.0 ) ));
				float lerpResult20_g397 = lerp( lerpResult17_g397 , texCoord15_g397.z , saturate( ( temp_output_5_0_g397 - 5.0 ) ));
				float lerpResult23_g397 = lerp( lerpResult20_g397 , texCoord15_g397.w , saturate( ( temp_output_5_0_g397 - 6.0 ) ));
				float2 appendResult580 = (float2(lerpResult23_g398 , lerpResult23_g397));
				float2 lerpResult587 = lerp( appendResult579 , appendResult580 , _customtoogle_vertexmaskoffset);
				float2 break54_g408 = (( ( ( panner20_g408 - temp_cast_9 ) * _scale_vertexmask ) + 0.5 )*appendResult586 + lerpResult587);
				float clampResult55_g408 = clamp( break54_g408.x , 0.0 , 1.0 );
				float lerpResult58_g408 = lerp( break54_g408.x , clampResult55_g408 , _clampx_vertexmask);
				float clampResult56_g408 = clamp( break54_g408.y , 0.0 , 1.0 );
				float lerpResult59_g408 = lerp( break54_g408.y , clampResult56_g408 , _clampy_vertexmask);
				float2 appendResult57_g408 = (float2(lerpResult58_g408 , lerpResult59_g408));
				float div68_g408=256.0/float((int)( 1.0 + _posterize_vertexmask ));
				float4 posterize68_g408 = ( floor( float4( (appendResult57_g408).xy, 0.0 , 0.0 ) * div68_g408 ) / div68_g408 );
				float2 lerpResult67_g408 = lerp( appendResult57_g408 , (posterize68_g408).rg , _posterizetoogle_vertexmask);
				float4 tex2DNode599 = tex2Dlod( _vertexmask, float4( lerpResult67_g408, 0, 0.0) );
				float temp_output_79_0_g411 = _alpha_vertexmask;
				float lerpResult64_g411 = lerp( tex2DNode599.a , tex2DNode599.r , temp_output_79_0_g411);
				float clampResult68_g411 = clamp( ( temp_output_79_0_g411 - 1.0 ) , 0.0 , 1.0 );
				float lerpResult66_g411 = lerp( lerpResult64_g411 , tex2DNode599.g , clampResult68_g411);
				float clampResult70_g411 = clamp( ( temp_output_79_0_g411 - 2.0 ) , 0.0 , 1.0 );
				float lerpResult69_g411 = lerp( lerpResult66_g411 , tex2DNode599.b , clampResult70_g411);
				float temp_output_602_0 = (_vertex_remapmask.z + (lerpResult69_g411 - _vertex_remapmask.x) * (_vertex_remapmask.w - _vertex_remapmask.z) / (_vertex_remapmask.y - _vertex_remapmask.x));
				float lerpResult605 = lerp( ( temp_output_525_0 * temp_output_602_0 ) , ( temp_output_525_0 + temp_output_602_0 ) , _veretxmaskmode);
				float3 temp_cast_12 = (1.0).xxx;
				float3 lerpResult528 = lerp( v.ase_normal , temp_cast_12 , _toogele_vertexnormal);
				float4 texCoord1_g412 = v.ase_texcoord1;
				texCoord1_g412.xy = v.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_5_0_g412 = _customvertexscale;
				float lerpResult2_g412 = lerp( texCoord1_g412.x , texCoord1_g412.y , temp_output_5_0_g412);
				float lerpResult6_g412 = lerp( lerpResult2_g412 , texCoord1_g412.z , saturate( ( temp_output_5_0_g412 - 1.0 ) ));
				float lerpResult11_g412 = lerp( lerpResult6_g412 , texCoord1_g412.w , saturate( ( temp_output_5_0_g412 - 2.0 ) ));
				float4 texCoord15_g412 = v.ase_texcoord2;
				texCoord15_g412.xy = v.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult13_g412 = lerp( lerpResult11_g412 , texCoord15_g412.x , saturate( ( temp_output_5_0_g412 - 3.0 ) ));
				float lerpResult17_g412 = lerp( lerpResult13_g412 , texCoord15_g412.y , saturate( ( temp_output_5_0_g412 - 4.0 ) ));
				float lerpResult20_g412 = lerp( lerpResult17_g412 , texCoord15_g412.z , saturate( ( temp_output_5_0_g412 - 5.0 ) ));
				float lerpResult23_g412 = lerp( lerpResult20_g412 , texCoord15_g412.w , saturate( ( temp_output_5_0_g412 - 6.0 ) ));
				float lerpResult558 = lerp( 1.0 , lerpResult23_g412 , _customtoogle_vertexscale);
				float3 vertex533 = ( lerpResult605 * lerpResult528 * _veretx_intensity * lerpResult558 * 0.1 );
				
				o.ase_texcoord3 = screenPos;
				float3 ase_tangentWS = UnityObjectToWorldDir(v.ase_tangent);
				o.ase_texcoord5.xyz = ase_tangentWS;
				float3 ase_normalWS = UnityObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord6.xyz = ase_normalWS;
				float ase_tangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_bitangentWS = cross( ase_normalWS, ase_tangentWS ) * ase_tangentSign;
				o.ase_texcoord7.xyz = ase_bitangentWS;
				float3 customSurfaceDepth884 = v.vertex.xyz;
				float customEye884 = -UnityObjectToViewPos(customSurfaceDepth884).z;
				o.ase_texcoord1.w = customEye884;
				float3 vertexPos890 = v.vertex.xyz;
				float4 ase_positionCS890 = UnityObjectToClipPos(vertexPos890);
				float4 screenPos890 = ComputeScreenPos(ase_positionCS890);
				o.ase_texcoord8 = screenPos890;
				
				o.ase_texcoord1.xyz = v.ase_texcoord.xyz;
				o.ase_texcoord2 = v.ase_texcoord1;
				o.ase_texcoord4 = v.ase_texcoord2;
				o.ase_color = v.color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord5.w = 0;
				o.ase_texcoord6.w = 0;
				o.ase_texcoord7.w = 0;
				float3 vertexValue = float3(0, 0, 0);
				#if ASE_ABSOLUTE_VERTEX_POS
				vertexValue = v.vertex.xyz;
				#endif
				vertexValue = vertex533;
				#if ASE_ABSOLUTE_VERTEX_POS
				v.vertex.xyz = vertexValue;
				#else
				v.vertex.xyz += vertexValue;
				#endif
				o.vertex = UnityObjectToClipPos(v.vertex);

				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				#endif
				return o;
			}
			
			fixed4 frag (v2f i ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(i);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);
				fixed4 finalColor;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 WorldPosition = i.worldPos;
				#endif
				float4 temp_cast_0 = (1.0).xxxx;
				float2 appendResult1158 = (float2(_speed_skew_normal.x , _speed_skew_normal.y));
				float2 lerpResult1148 = lerp( i.ase_texcoord1.xyz.xy , i.ase_texcoord2.xy , _uv_normal);
				float4 screenPos = i.ase_texcoord3;
				float4 ase_grabScreenPos = ASE_ComputeGrabScreenPos( screenPos );
				float4 ase_grabScreenPosNorm = ase_grabScreenPos / ase_grabScreenPos.w;
				float2 appendResult1152 = (float2(ase_grabScreenPosNorm.r , ase_grabScreenPosNorm.g));
				float2 lerpResult1155 = lerp( lerpResult1148 , appendResult1152 , saturate( ( _uv_normal - 1.0 ) ));
				float2 temp_output_51_0_g377 = lerpResult1155;
				float2 temp_output_34_0_g378 = ( temp_output_51_0_g377 - float2( 0.5,0.5 ) );
				float2 break39_g378 = temp_output_34_0_g378;
				float2 appendResult50_g378 = (float2(( 1.0 * ( length( temp_output_34_0_g378 ) * 2.0 ) ) , ( ( atan2( break39_g378.x , break39_g378.y ) * ( 1.0 / 6.28318548202515 ) ) * 1.0 )));
				float2 lerpResult14_g377 = lerp( temp_output_51_0_g377 , appendResult50_g378 , _polar_normal);
				float3 appendResult11_g377 = (float3(1.0 , _speed_skew_normal.z , 0.0));
				float3 appendResult9_g377 = (float3(_speed_skew_normal.w , 1.0 , 0.0));
				float2 temp_cast_3 = (0.5).xx;
				float cos18_g377 = cos( ( _rotate_normal * UNITY_PI ) );
				float sin18_g377 = sin( ( _rotate_normal * UNITY_PI ) );
				float2 rotator18_g377 = mul( mul( float3( lerpResult14_g377 ,  0.0 ), float3x3(appendResult11_g377, appendResult9_g377, float3(0,0,1)) ).xy - temp_cast_3 , float2x2( cos18_g377 , -sin18_g377 , sin18_g377 , cos18_g377 )) + temp_cast_3;
				float2 panner20_g377 = ( 1.0 * _Time.y * appendResult1158 + rotator18_g377);
				float2 temp_cast_4 = (0.5).xx;
				float2 appendResult1156 = (float2(_normalmap_ST.x , _normalmap_ST.y));
				float2 appendResult1149 = (float2(_normalmap_ST.z , _normalmap_ST.w));
				float4 texCoord1_g364 = i.ase_texcoord2;
				texCoord1_g364.xy = i.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_5_0_g364 = _customnormalx;
				float lerpResult2_g364 = lerp( texCoord1_g364.x , texCoord1_g364.y , temp_output_5_0_g364);
				float lerpResult6_g364 = lerp( lerpResult2_g364 , texCoord1_g364.z , saturate( ( temp_output_5_0_g364 - 1.0 ) ));
				float lerpResult11_g364 = lerp( lerpResult6_g364 , texCoord1_g364.w , saturate( ( temp_output_5_0_g364 - 2.0 ) ));
				float4 texCoord15_g364 = i.ase_texcoord4;
				texCoord15_g364.xy = i.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult13_g364 = lerp( lerpResult11_g364 , texCoord15_g364.x , saturate( ( temp_output_5_0_g364 - 3.0 ) ));
				float lerpResult17_g364 = lerp( lerpResult13_g364 , texCoord15_g364.y , saturate( ( temp_output_5_0_g364 - 4.0 ) ));
				float lerpResult20_g364 = lerp( lerpResult17_g364 , texCoord15_g364.z , saturate( ( temp_output_5_0_g364 - 5.0 ) ));
				float lerpResult23_g364 = lerp( lerpResult20_g364 , texCoord15_g364.w , saturate( ( temp_output_5_0_g364 - 6.0 ) ));
				float4 texCoord1_g363 = i.ase_texcoord2;
				texCoord1_g363.xy = i.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_5_0_g363 = _customnormaly;
				float lerpResult2_g363 = lerp( texCoord1_g363.x , texCoord1_g363.y , temp_output_5_0_g363);
				float lerpResult6_g363 = lerp( lerpResult2_g363 , texCoord1_g363.z , saturate( ( temp_output_5_0_g363 - 1.0 ) ));
				float lerpResult11_g363 = lerp( lerpResult6_g363 , texCoord1_g363.w , saturate( ( temp_output_5_0_g363 - 2.0 ) ));
				float4 texCoord15_g363 = i.ase_texcoord4;
				texCoord15_g363.xy = i.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult13_g363 = lerp( lerpResult11_g363 , texCoord15_g363.x , saturate( ( temp_output_5_0_g363 - 3.0 ) ));
				float lerpResult17_g363 = lerp( lerpResult13_g363 , texCoord15_g363.y , saturate( ( temp_output_5_0_g363 - 4.0 ) ));
				float lerpResult20_g363 = lerp( lerpResult17_g363 , texCoord15_g363.z , saturate( ( temp_output_5_0_g363 - 5.0 ) ));
				float lerpResult23_g363 = lerp( lerpResult20_g363 , texCoord15_g363.w , saturate( ( temp_output_5_0_g363 - 6.0 ) ));
				float2 appendResult1150 = (float2(lerpResult23_g364 , lerpResult23_g363));
				float2 lerpResult1157 = lerp( appendResult1149 , appendResult1150 , _customtoogle_normaloffset);
				float2 break54_g377 = (( ( ( panner20_g377 - temp_cast_4 ) * _scale_normal ) + 0.5 )*appendResult1156 + lerpResult1157);
				float clampResult55_g377 = clamp( break54_g377.x , 0.0 , 1.0 );
				float lerpResult58_g377 = lerp( break54_g377.x , clampResult55_g377 , _clampx_normal);
				float clampResult56_g377 = clamp( break54_g377.y , 0.0 , 1.0 );
				float lerpResult59_g377 = lerp( break54_g377.y , clampResult56_g377 , _clampy_normal);
				float2 appendResult57_g377 = (float2(lerpResult58_g377 , lerpResult59_g377));
				float div68_g377=256.0/float((int)( 1.0 + 0.0 ));
				float4 posterize68_g377 = ( floor( float4( (appendResult57_g377).xy, 0.0 , 0.0 ) * div68_g377 ) / div68_g377 );
				float2 lerpResult67_g377 = lerp( appendResult57_g377 , (posterize68_g377).rg , 0.0);
				float4 texCoord1_g367 = i.ase_texcoord2;
				texCoord1_g367.xy = i.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_5_0_g367 = _customnormal_scale;
				float lerpResult2_g367 = lerp( texCoord1_g367.x , texCoord1_g367.y , temp_output_5_0_g367);
				float lerpResult6_g367 = lerp( lerpResult2_g367 , texCoord1_g367.z , saturate( ( temp_output_5_0_g367 - 1.0 ) ));
				float lerpResult11_g367 = lerp( lerpResult6_g367 , texCoord1_g367.w , saturate( ( temp_output_5_0_g367 - 2.0 ) ));
				float4 texCoord15_g367 = i.ase_texcoord4;
				texCoord15_g367.xy = i.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult13_g367 = lerp( lerpResult11_g367 , texCoord15_g367.x , saturate( ( temp_output_5_0_g367 - 3.0 ) ));
				float lerpResult17_g367 = lerp( lerpResult13_g367 , texCoord15_g367.y , saturate( ( temp_output_5_0_g367 - 4.0 ) ));
				float lerpResult20_g367 = lerp( lerpResult17_g367 , texCoord15_g367.z , saturate( ( temp_output_5_0_g367 - 5.0 ) ));
				float lerpResult23_g367 = lerp( lerpResult20_g367 , texCoord15_g367.w , saturate( ( temp_output_5_0_g367 - 6.0 ) ));
				float lerpResult1176 = lerp( _noraml_scale , lerpResult23_g367 , _customtoogle_normal);
				float3 normal1169 = UnpackScaleNormal( tex2D( _normalmap, lerpResult67_g377 ), ( lerpResult1176 * 0.1 ) );
				float3 ase_tangentWS = i.ase_texcoord5.xyz;
				float3 ase_normalWS = i.ase_texcoord6.xyz;
				float3 ase_bitangentWS = i.ase_texcoord7.xyz;
				float3 tanToWorld0 = float3( ase_tangentWS.x, ase_bitangentWS.x, ase_normalWS.x );
				float3 tanToWorld1 = float3( ase_tangentWS.y, ase_bitangentWS.y, ase_normalWS.y );
				float3 tanToWorld2 = float3( ase_tangentWS.z, ase_bitangentWS.z, ase_normalWS.z );
				float3 tanNormal751 = normal1169;
				float3 worldNormal751 = float3(dot(tanToWorld0,tanNormal751), dot(tanToWorld1,tanNormal751), dot(tanToWorld2,tanNormal751));
				float3 desaturateInitialColor753 = tex2D( _Matcap, ( ( (mul( UNITY_MATRIX_V, float4( worldNormal751 , 0.0 ) ).xyz).xy + float2( 1,1 ) ) * float2( 0.5,0.5 ) ) ).rgb;
				float desaturateDot753 = dot( desaturateInitialColor753, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar753 = lerp( desaturateInitialColor753, desaturateDot753.xxx, _matcapdesature );
				float3 ase_viewVectorWS = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				float3 ase_viewDirWS = normalize( ase_viewVectorWS );
				float3 tanNormal757 = normal1169;
				float3 worldNormal757 = float3(dot(tanToWorld0,tanNormal757), dot(tanToWorld1,tanNormal757), dot(tanToWorld2,tanNormal757));
				float4 lerpResult766 = lerp( temp_cast_0 , ( float4( ( desaturateVar753 * _matcap_scale ) , 0.0 ) + ( texCUBE( _Cubemap, reflect( -ase_viewDirWS , worldNormal757 ) ) * _cube_scale ) ) , _toggle_matcao);
				float4 matcap765 = lerpResult766;
				float customEye884 = i.ase_texcoord1.w;
				float cameraDepthFade884 = (( customEye884 -_ProjectionParams.y - _camDepthfade_offset ) / _camDepthfade_distance1);
				float4 screenPos890 = i.ase_texcoord8;
				float4 ase_positionSSNorm = screenPos890 / screenPos890.w;
				ase_positionSSNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_positionSSNorm.z : ase_positionSSNorm.z * 0.5 + 0.5;
				float screenDepth890 = LinearEyeDepth(SAMPLE_DEPTH_TEXTURE( _CameraDepthTexture, ase_positionSSNorm.xy ));
				float distanceDepth890 = saturate( ( screenDepth890 - LinearEyeDepth( ase_positionSSNorm.z ) ) / ( _Depthfade_distance ) );
				float lerpResult888 = lerp( distanceDepth890 , ( 1.0 - distanceDepth890 ) , _Depthfadeinvert_toggle);
				float temp_output_887_0 = ( saturate( cameraDepthFade884 ) * lerpResult888 );
				float depthfade_invert_toggle898 = _Depthfadeinvert_toggle;
				float lerpResult899 = lerp( 0.0 , temp_output_887_0 , depthfade_invert_toggle898);
				float saferPower905 = abs( lerpResult899 );
				float3 Depthfade_invert902 = ( _Depthfade_invertscale * pow( saferPower905 , _Depthfade_invertpower ) * _depthcolor.rgb );
				float3 temp_cast_13 = (1.0).xxx;
				#if defined(LIGHTMAP_ON) && ( UNITY_VERSION < 560 || ( defined(LIGHTMAP_SHADOW_MIXING) && !defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) ) )//aselc
				float4 ase_lightColor = 0;
				#else //aselc
				float4 ase_lightColor = _LightColor0;
				#endif //aselc
				float4 color954 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
				float3 worldSpaceLightDir = Unity_SafeNormalize(UnityWorldSpaceLightDir(WorldPosition));
				float3 tanNormal937 = normal1169;
				float3 worldNormal937 = float3(dot(tanToWorld0,tanNormal937), dot(tanToWorld1,tanNormal937), dot(tanToWorld2,tanNormal937));
				float3 normalizeResult943 = normalize( worldNormal937 );
				float dotResult939 = dot( worldSpaceLightDir , normalizeResult943 );
				float3 lerpResult933 = lerp( ( color954.rgb * ( 1.0 - _shadow_intensity ) ) , color954.rgb , saturate( ( ( dotResult939 + _shadowarea ) / _shadowsoft ) ));
				float3 tanNormal1227 = normal1169;
				float3 worldNormal1227 = float3(dot(tanToWorld0,tanNormal1227), dot(tanToWorld1,tanNormal1227), dot(tanToWorld2,tanNormal1227));
				float3 normalizeResult1228 = normalize( worldNormal1227 );
				float dotResult1230 = dot( worldSpaceLightDir , normalizeResult1228 );
				float4 color1236 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
				float3 lerpResult1085 = lerp( temp_cast_13 , ( ( ase_lightColor.rgb * lerpResult933 ) + ( saturate( ( ( dotResult1230 + _lightarea ) / _lightsoft ) ) * color1236.rgb * ase_lightColor.rgb * _lightscale ) ) , _Float19);
				float3 npr962 = lerpResult1085;
				float2 appendResult130 = (float2(_speed_skew_subtex.x , _speed_skew_subtex.y));
				float2 lerpResult119 = lerp( i.ase_texcoord1.xyz.xy , i.ase_texcoord2.xy , _uv_subtex);
				float2 appendResult117 = (float2(ase_grabScreenPosNorm.r , ase_grabScreenPosNorm.g));
				float2 lerpResult120 = lerp( lerpResult119 , appendResult117 , saturate( ( _uv_subtex - 1.0 ) ));
				float2 uv_flowmap = i.ase_texcoord1.xyz.xy * _flowmap_ST.xy + _flowmap_ST.zw;
				float4 tex2DNode967 = tex2D( _flowmap, uv_flowmap );
				float2 appendResult968 = (float2(tex2DNode967.r , tex2DNode967.g));
				float2 flowmapuv969 = appendResult968;
				float4 texCoord1_g272 = i.ase_texcoord2;
				texCoord1_g272.xy = i.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_5_0_g272 = _customflowmap;
				float lerpResult2_g272 = lerp( texCoord1_g272.x , texCoord1_g272.y , temp_output_5_0_g272);
				float lerpResult6_g272 = lerp( lerpResult2_g272 , texCoord1_g272.z , saturate( ( temp_output_5_0_g272 - 1.0 ) ));
				float lerpResult11_g272 = lerp( lerpResult6_g272 , texCoord1_g272.w , saturate( ( temp_output_5_0_g272 - 2.0 ) ));
				float4 texCoord15_g272 = i.ase_texcoord4;
				texCoord15_g272.xy = i.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult13_g272 = lerp( lerpResult11_g272 , texCoord15_g272.x , saturate( ( temp_output_5_0_g272 - 3.0 ) ));
				float lerpResult17_g272 = lerp( lerpResult13_g272 , texCoord15_g272.y , saturate( ( temp_output_5_0_g272 - 4.0 ) ));
				float lerpResult20_g272 = lerp( lerpResult17_g272 , texCoord15_g272.z , saturate( ( temp_output_5_0_g272 - 5.0 ) ));
				float lerpResult23_g272 = lerp( lerpResult20_g272 , texCoord15_g272.w , saturate( ( temp_output_5_0_g272 - 6.0 ) ));
				float lerpResult1058 = lerp( _flowmap_intensity , lerpResult23_g272 , _customtoogle_flowmap);
				float flowmap_intensity971 = lerpResult1058;
				float2 lerpResult976 = lerp( lerpResult120 , flowmapuv969 , flowmap_intensity971);
				float2 lerpResult988 = lerp( lerpResult120 , lerpResult976 , _flowmaptoggle_sub);
				float2 temp_output_51_0_g313 = lerpResult988;
				float2 temp_output_34_0_g314 = ( temp_output_51_0_g313 - float2( 0.5,0.5 ) );
				float2 break39_g314 = temp_output_34_0_g314;
				float2 appendResult50_g314 = (float2(( 1.0 * ( length( temp_output_34_0_g314 ) * 2.0 ) ) , ( ( atan2( break39_g314.x , break39_g314.y ) * ( 1.0 / 6.28318548202515 ) ) * 1.0 )));
				float2 lerpResult14_g313 = lerp( temp_output_51_0_g313 , appendResult50_g314 , _polar_subtex);
				float3 appendResult11_g313 = (float3(1.0 , _speed_skew_subtex.z , 0.0));
				float3 appendResult9_g313 = (float3(_speed_skew_subtex.w , 1.0 , 0.0));
				float2 temp_cast_16 = (0.5).xx;
				float cos18_g313 = cos( ( _rotate_subtex * UNITY_PI ) );
				float sin18_g313 = sin( ( _rotate_subtex * UNITY_PI ) );
				float2 rotator18_g313 = mul( mul( float3( lerpResult14_g313 ,  0.0 ), float3x3(appendResult11_g313, appendResult9_g313, float3(0,0,1)) ).xy - temp_cast_16 , float2x2( cos18_g313 , -sin18_g313 , sin18_g313 , cos18_g313 )) + temp_cast_16;
				float2 panner20_g313 = ( 1.0 * _Time.y * appendResult130 + rotator18_g313);
				float2 temp_cast_17 = (0.5).xx;
				float2 appendResult134 = (float2(_subtex_ST.x , _subtex_ST.y));
				float2 appendResult127 = (float2(_subtex_ST.z , _subtex_ST.w));
				float4 texCoord1_g289 = i.ase_texcoord2;
				texCoord1_g289.xy = i.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_5_0_g289 = _customsubx;
				float lerpResult2_g289 = lerp( texCoord1_g289.x , texCoord1_g289.y , temp_output_5_0_g289);
				float lerpResult6_g289 = lerp( lerpResult2_g289 , texCoord1_g289.z , saturate( ( temp_output_5_0_g289 - 1.0 ) ));
				float lerpResult11_g289 = lerp( lerpResult6_g289 , texCoord1_g289.w , saturate( ( temp_output_5_0_g289 - 2.0 ) ));
				float4 texCoord15_g289 = i.ase_texcoord4;
				texCoord15_g289.xy = i.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult13_g289 = lerp( lerpResult11_g289 , texCoord15_g289.x , saturate( ( temp_output_5_0_g289 - 3.0 ) ));
				float lerpResult17_g289 = lerp( lerpResult13_g289 , texCoord15_g289.y , saturate( ( temp_output_5_0_g289 - 4.0 ) ));
				float lerpResult20_g289 = lerp( lerpResult17_g289 , texCoord15_g289.z , saturate( ( temp_output_5_0_g289 - 5.0 ) ));
				float lerpResult23_g289 = lerp( lerpResult20_g289 , texCoord15_g289.w , saturate( ( temp_output_5_0_g289 - 6.0 ) ));
				float4 texCoord1_g288 = i.ase_texcoord2;
				texCoord1_g288.xy = i.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_5_0_g288 = _customsuby;
				float lerpResult2_g288 = lerp( texCoord1_g288.x , texCoord1_g288.y , temp_output_5_0_g288);
				float lerpResult6_g288 = lerp( lerpResult2_g288 , texCoord1_g288.z , saturate( ( temp_output_5_0_g288 - 1.0 ) ));
				float lerpResult11_g288 = lerp( lerpResult6_g288 , texCoord1_g288.w , saturate( ( temp_output_5_0_g288 - 2.0 ) ));
				float4 texCoord15_g288 = i.ase_texcoord4;
				texCoord15_g288.xy = i.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult13_g288 = lerp( lerpResult11_g288 , texCoord15_g288.x , saturate( ( temp_output_5_0_g288 - 3.0 ) ));
				float lerpResult17_g288 = lerp( lerpResult13_g288 , texCoord15_g288.y , saturate( ( temp_output_5_0_g288 - 4.0 ) ));
				float lerpResult20_g288 = lerp( lerpResult17_g288 , texCoord15_g288.z , saturate( ( temp_output_5_0_g288 - 5.0 ) ));
				float lerpResult23_g288 = lerp( lerpResult20_g288 , texCoord15_g288.w , saturate( ( temp_output_5_0_g288 - 6.0 ) ));
				float2 appendResult128 = (float2(lerpResult23_g289 , lerpResult23_g288));
				float2 lerpResult135 = lerp( appendResult127 , appendResult128 , _customtoogle_suboffset);
				float2 break54_g313 = (( ( ( panner20_g313 - temp_cast_17 ) * _scale_subtex ) + 0.5 )*appendResult134 + lerpResult135);
				float clampResult55_g313 = clamp( break54_g313.x , 0.0 , 1.0 );
				float lerpResult58_g313 = lerp( break54_g313.x , clampResult55_g313 , _clampx_subtex);
				float clampResult56_g313 = clamp( break54_g313.y , 0.0 , 1.0 );
				float lerpResult59_g313 = lerp( break54_g313.y , clampResult56_g313 , _clampy_subtex);
				float2 appendResult57_g313 = (float2(lerpResult58_g313 , lerpResult59_g313));
				float div68_g313=256.0/float((int)( 1.0 + _posterize_subtex ));
				float4 posterize68_g313 = ( floor( float4( (appendResult57_g313).xy, 0.0 , 0.0 ) * div68_g313 ) / div68_g313 );
				float2 lerpResult67_g313 = lerp( appendResult57_g313 , (posterize68_g313).rg , _posterizetoogle_subtex);
				float2 appendResult370 = (float2(_speed_skew_noise.x , _speed_skew_noise.y));
				float2 lerpResult360 = lerp( i.ase_texcoord1.xyz.xy , i.ase_texcoord2.xy , _uv_noise);
				float2 appendResult361 = (float2(ase_grabScreenPosNorm.r , ase_grabScreenPosNorm.g));
				float2 lerpResult367 = lerp( lerpResult360 , appendResult361 , saturate( ( _uv_noise - 1.0 ) ));
				float2 lerpResult1007 = lerp( lerpResult367 , flowmapuv969 , flowmap_intensity971);
				float2 lerpResult1009 = lerp( lerpResult367 , lerpResult1007 , _flowmaptoggle_noise);
				float2 temp_output_51_0_g283 = lerpResult1009;
				float2 temp_output_34_0_g284 = ( temp_output_51_0_g283 - float2( 0.5,0.5 ) );
				float2 break39_g284 = temp_output_34_0_g284;
				float2 appendResult50_g284 = (float2(( 1.0 * ( length( temp_output_34_0_g284 ) * 2.0 ) ) , ( ( atan2( break39_g284.x , break39_g284.y ) * ( 1.0 / 6.28318548202515 ) ) * 1.0 )));
				float2 lerpResult14_g283 = lerp( temp_output_51_0_g283 , appendResult50_g284 , _polar_noise);
				float3 appendResult11_g283 = (float3(1.0 , _speed_skew_noise.z , 0.0));
				float3 appendResult9_g283 = (float3(_speed_skew_noise.w , 1.0 , 0.0));
				float2 temp_cast_23 = (0.5).xx;
				float cos18_g283 = cos( ( _rotate_noise * UNITY_PI ) );
				float sin18_g283 = sin( ( _rotate_noise * UNITY_PI ) );
				float2 rotator18_g283 = mul( mul( float3( lerpResult14_g283 ,  0.0 ), float3x3(appendResult11_g283, appendResult9_g283, float3(0,0,1)) ).xy - temp_cast_23 , float2x2( cos18_g283 , -sin18_g283 , sin18_g283 , cos18_g283 )) + temp_cast_23;
				float2 panner20_g283 = ( 1.0 * _Time.y * appendResult370 + rotator18_g283);
				float2 temp_cast_24 = (0.5).xx;
				float2 appendResult368 = (float2(_noise_ST.x , _noise_ST.y));
				float2 appendResult362 = (float2(_noise_ST.z , _noise_ST.w));
				float4 texCoord1_g276 = i.ase_texcoord2;
				texCoord1_g276.xy = i.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_5_0_g276 = _customnoisex;
				float lerpResult2_g276 = lerp( texCoord1_g276.x , texCoord1_g276.y , temp_output_5_0_g276);
				float lerpResult6_g276 = lerp( lerpResult2_g276 , texCoord1_g276.z , saturate( ( temp_output_5_0_g276 - 1.0 ) ));
				float lerpResult11_g276 = lerp( lerpResult6_g276 , texCoord1_g276.w , saturate( ( temp_output_5_0_g276 - 2.0 ) ));
				float4 texCoord15_g276 = i.ase_texcoord4;
				texCoord15_g276.xy = i.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult13_g276 = lerp( lerpResult11_g276 , texCoord15_g276.x , saturate( ( temp_output_5_0_g276 - 3.0 ) ));
				float lerpResult17_g276 = lerp( lerpResult13_g276 , texCoord15_g276.y , saturate( ( temp_output_5_0_g276 - 4.0 ) ));
				float lerpResult20_g276 = lerp( lerpResult17_g276 , texCoord15_g276.z , saturate( ( temp_output_5_0_g276 - 5.0 ) ));
				float lerpResult23_g276 = lerp( lerpResult20_g276 , texCoord15_g276.w , saturate( ( temp_output_5_0_g276 - 6.0 ) ));
				float4 texCoord1_g275 = i.ase_texcoord2;
				texCoord1_g275.xy = i.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_5_0_g275 = _customnoisey;
				float lerpResult2_g275 = lerp( texCoord1_g275.x , texCoord1_g275.y , temp_output_5_0_g275);
				float lerpResult6_g275 = lerp( lerpResult2_g275 , texCoord1_g275.z , saturate( ( temp_output_5_0_g275 - 1.0 ) ));
				float lerpResult11_g275 = lerp( lerpResult6_g275 , texCoord1_g275.w , saturate( ( temp_output_5_0_g275 - 2.0 ) ));
				float4 texCoord15_g275 = i.ase_texcoord4;
				texCoord15_g275.xy = i.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult13_g275 = lerp( lerpResult11_g275 , texCoord15_g275.x , saturate( ( temp_output_5_0_g275 - 3.0 ) ));
				float lerpResult17_g275 = lerp( lerpResult13_g275 , texCoord15_g275.y , saturate( ( temp_output_5_0_g275 - 4.0 ) ));
				float lerpResult20_g275 = lerp( lerpResult17_g275 , texCoord15_g275.z , saturate( ( temp_output_5_0_g275 - 5.0 ) ));
				float lerpResult23_g275 = lerp( lerpResult20_g275 , texCoord15_g275.w , saturate( ( temp_output_5_0_g275 - 6.0 ) ));
				float2 appendResult363 = (float2(lerpResult23_g276 , lerpResult23_g275));
				float2 lerpResult369 = lerp( appendResult362 , appendResult363 , _customtoogle_noiseoffset);
				float2 break54_g283 = (( ( ( panner20_g283 - temp_cast_24 ) * _scale_noise ) + 0.5 )*appendResult368 + lerpResult369);
				float clampResult55_g283 = clamp( break54_g283.x , 0.0 , 1.0 );
				float lerpResult58_g283 = lerp( break54_g283.x , clampResult55_g283 , _clampx_noise);
				float clampResult56_g283 = clamp( break54_g283.y , 0.0 , 1.0 );
				float lerpResult59_g283 = lerp( break54_g283.y , clampResult56_g283 , _clampy_noise);
				float2 appendResult57_g283 = (float2(lerpResult58_g283 , lerpResult59_g283));
				float div68_g283=256.0/float((int)( 1.0 + _posterize_noise ));
				float4 posterize68_g283 = ( floor( float4( (appendResult57_g283).xy, 0.0 , 0.0 ) * div68_g283 ) / div68_g283 );
				float2 lerpResult67_g283 = lerp( appendResult57_g283 , (posterize68_g283).rg , _posterizetoogle_noise);
				float2 noiseuv659 = lerpResult67_g283;
				float2 temp_output_24_0_g297 = noiseuv659;
				float2 break20_g297 = temp_output_24_0_g297;
				float noise_offset686 = _offset;
				float temp_output_11_0_g297 = noise_offset686;
				float temp_output_3_0_g297 = ( pow( temp_output_11_0_g297 , 3.0 ) * 0.1 );
				float2 appendResult23_g297 = (float2(( break20_g297.x + temp_output_3_0_g297 ) , break20_g297.y));
				float4 tex2DNode5_g297 = tex2D( _noise, appendResult23_g297 );
				float noisetex_alpha652 = _alpha_noise;
				float temp_output_32_0_g297 = noisetex_alpha652;
				float temp_output_79_0_g299 = temp_output_32_0_g297;
				float lerpResult64_g299 = lerp( tex2DNode5_g297.a , tex2DNode5_g297.r , temp_output_79_0_g299);
				float clampResult68_g299 = clamp( ( temp_output_79_0_g299 - 1.0 ) , 0.0 , 1.0 );
				float lerpResult66_g299 = lerp( lerpResult64_g299 , tex2DNode5_g297.g , clampResult68_g299);
				float clampResult70_g299 = clamp( ( temp_output_79_0_g299 - 2.0 ) , 0.0 , 1.0 );
				float lerpResult69_g299 = lerp( lerpResult66_g299 , tex2DNode5_g297.b , clampResult70_g299);
				float temp_output_29_0_g297 = lerpResult69_g299;
				float2 appendResult474 = (float2(_speed_skew_noisemask.x , _speed_skew_noisemask.y));
				float2 lerpResult464 = lerp( i.ase_texcoord1.xyz.xy , i.ase_texcoord2.xy , _uv_noisemask);
				float2 appendResult465 = (float2(ase_grabScreenPosNorm.r , ase_grabScreenPosNorm.g));
				float2 lerpResult471 = lerp( lerpResult464 , appendResult465 , saturate( ( _uv_noisemask - 1.0 ) ));
				float2 lerpResult1013 = lerp( lerpResult471 , flowmapuv969 , flowmap_intensity971);
				float2 lerpResult1015 = lerp( lerpResult471 , lerpResult1013 , _flowmaptoggle_noisemask);
				float2 temp_output_51_0_g285 = lerpResult1015;
				float2 temp_output_34_0_g286 = ( temp_output_51_0_g285 - float2( 0.5,0.5 ) );
				float2 break39_g286 = temp_output_34_0_g286;
				float2 appendResult50_g286 = (float2(( 1.0 * ( length( temp_output_34_0_g286 ) * 2.0 ) ) , ( ( atan2( break39_g286.x , break39_g286.y ) * ( 1.0 / 6.28318548202515 ) ) * 1.0 )));
				float2 lerpResult14_g285 = lerp( temp_output_51_0_g285 , appendResult50_g286 , _polar_noisemask);
				float3 appendResult11_g285 = (float3(1.0 , _speed_skew_noisemask.z , 0.0));
				float3 appendResult9_g285 = (float3(_speed_skew_noisemask.w , 1.0 , 0.0));
				float2 temp_cast_29 = (0.5).xx;
				float cos18_g285 = cos( ( _rotate_noisemask * UNITY_PI ) );
				float sin18_g285 = sin( ( _rotate_noisemask * UNITY_PI ) );
				float2 rotator18_g285 = mul( mul( float3( lerpResult14_g285 ,  0.0 ), float3x3(appendResult11_g285, appendResult9_g285, float3(0,0,1)) ).xy - temp_cast_29 , float2x2( cos18_g285 , -sin18_g285 , sin18_g285 , cos18_g285 )) + temp_cast_29;
				float2 panner20_g285 = ( 1.0 * _Time.y * appendResult474 + rotator18_g285);
				float2 temp_cast_30 = (0.5).xx;
				float2 appendResult472 = (float2(_noisemask_ST.x , _noisemask_ST.y));
				float2 appendResult466 = (float2(_noisemask_ST.z , _noisemask_ST.w));
				float4 texCoord1_g278 = i.ase_texcoord2;
				texCoord1_g278.xy = i.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_5_0_g278 = _customnoisemaskx;
				float lerpResult2_g278 = lerp( texCoord1_g278.x , texCoord1_g278.y , temp_output_5_0_g278);
				float lerpResult6_g278 = lerp( lerpResult2_g278 , texCoord1_g278.z , saturate( ( temp_output_5_0_g278 - 1.0 ) ));
				float lerpResult11_g278 = lerp( lerpResult6_g278 , texCoord1_g278.w , saturate( ( temp_output_5_0_g278 - 2.0 ) ));
				float4 texCoord15_g278 = i.ase_texcoord4;
				texCoord15_g278.xy = i.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult13_g278 = lerp( lerpResult11_g278 , texCoord15_g278.x , saturate( ( temp_output_5_0_g278 - 3.0 ) ));
				float lerpResult17_g278 = lerp( lerpResult13_g278 , texCoord15_g278.y , saturate( ( temp_output_5_0_g278 - 4.0 ) ));
				float lerpResult20_g278 = lerp( lerpResult17_g278 , texCoord15_g278.z , saturate( ( temp_output_5_0_g278 - 5.0 ) ));
				float lerpResult23_g278 = lerp( lerpResult20_g278 , texCoord15_g278.w , saturate( ( temp_output_5_0_g278 - 6.0 ) ));
				float4 texCoord1_g277 = i.ase_texcoord2;
				texCoord1_g277.xy = i.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_5_0_g277 = _customnoisemasky;
				float lerpResult2_g277 = lerp( texCoord1_g277.x , texCoord1_g277.y , temp_output_5_0_g277);
				float lerpResult6_g277 = lerp( lerpResult2_g277 , texCoord1_g277.z , saturate( ( temp_output_5_0_g277 - 1.0 ) ));
				float lerpResult11_g277 = lerp( lerpResult6_g277 , texCoord1_g277.w , saturate( ( temp_output_5_0_g277 - 2.0 ) ));
				float4 texCoord15_g277 = i.ase_texcoord4;
				texCoord15_g277.xy = i.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult13_g277 = lerp( lerpResult11_g277 , texCoord15_g277.x , saturate( ( temp_output_5_0_g277 - 3.0 ) ));
				float lerpResult17_g277 = lerp( lerpResult13_g277 , texCoord15_g277.y , saturate( ( temp_output_5_0_g277 - 4.0 ) ));
				float lerpResult20_g277 = lerp( lerpResult17_g277 , texCoord15_g277.z , saturate( ( temp_output_5_0_g277 - 5.0 ) ));
				float lerpResult23_g277 = lerp( lerpResult20_g277 , texCoord15_g277.w , saturate( ( temp_output_5_0_g277 - 6.0 ) ));
				float2 appendResult467 = (float2(lerpResult23_g278 , lerpResult23_g277));
				float2 lerpResult473 = lerp( appendResult466 , appendResult467 , _customtoogle_noisemaskoffset);
				float2 break54_g285 = (( ( ( panner20_g285 - temp_cast_30 ) * _scale_noisemask ) + 0.5 )*appendResult472 + lerpResult473);
				float clampResult55_g285 = clamp( break54_g285.x , 0.0 , 1.0 );
				float lerpResult58_g285 = lerp( break54_g285.x , clampResult55_g285 , _clampx_noisemask);
				float clampResult56_g285 = clamp( break54_g285.y , 0.0 , 1.0 );
				float lerpResult59_g285 = lerp( break54_g285.y , clampResult56_g285 , _clampy_noisemask);
				float2 appendResult57_g285 = (float2(lerpResult58_g285 , lerpResult59_g285));
				float div68_g285=256.0/float((int)( 1.0 + _posterize_noisemask ));
				float4 posterize68_g285 = ( floor( float4( (appendResult57_g285).xy, 0.0 , 0.0 ) * div68_g285 ) / div68_g285 );
				float2 lerpResult67_g285 = lerp( appendResult57_g285 , (posterize68_g285).rg , _posterizetoogle_noisemask);
				float2 noisemaskuv665 = lerpResult67_g285;
				float2 temp_output_49_0_g297 = noisemaskuv665;
				float2 break43_g297 = temp_output_49_0_g297;
				float temp_output_42_0_g297 = ( pow( temp_output_11_0_g297 , 3.0 ) * 0.1 );
				float2 appendResult45_g297 = (float2(( break43_g297.x + temp_output_42_0_g297 ) , break43_g297.y));
				float4 tex2DNode37_g297 = tex2D( _noisemask, appendResult45_g297 );
				float noisemask_alpha670 = _alpha_noisemask;
				float temp_output_48_0_g297 = noisemask_alpha670;
				float temp_output_79_0_g302 = temp_output_48_0_g297;
				float lerpResult64_g302 = lerp( tex2DNode37_g297.a , tex2DNode37_g297.r , temp_output_79_0_g302);
				float clampResult68_g302 = clamp( ( temp_output_79_0_g302 - 1.0 ) , 0.0 , 1.0 );
				float lerpResult66_g302 = lerp( lerpResult64_g302 , tex2DNode37_g297.g , clampResult68_g302);
				float clampResult70_g302 = clamp( ( temp_output_79_0_g302 - 2.0 ) , 0.0 , 1.0 );
				float lerpResult69_g302 = lerp( lerpResult66_g302 , tex2DNode37_g297.b , clampResult70_g302);
				float temp_output_40_0_g297 = lerpResult69_g302;
				float noisemask_mode681 = _noisemaskmode;
				float temp_output_65_0_g297 = noisemask_mode681;
				float lerpResult58_g297 = lerp( ( temp_output_29_0_g297 * temp_output_40_0_g297 ) , ( temp_output_29_0_g297 + temp_output_40_0_g297 ) , temp_output_65_0_g297);
				float4 tex2DNode6_g297 = tex2D( _noise, temp_output_24_0_g297 );
				float temp_output_79_0_g298 = temp_output_32_0_g297;
				float lerpResult64_g298 = lerp( tex2DNode6_g297.a , tex2DNode6_g297.r , temp_output_79_0_g298);
				float clampResult68_g298 = clamp( ( temp_output_79_0_g298 - 1.0 ) , 0.0 , 1.0 );
				float lerpResult66_g298 = lerp( lerpResult64_g298 , tex2DNode6_g297.g , clampResult68_g298);
				float clampResult70_g298 = clamp( ( temp_output_79_0_g298 - 2.0 ) , 0.0 , 1.0 );
				float lerpResult69_g298 = lerp( lerpResult66_g298 , tex2DNode6_g297.b , clampResult70_g298);
				float temp_output_28_0_g297 = lerpResult69_g298;
				float4 tex2DNode36_g297 = tex2D( _noisemask, temp_output_49_0_g297 );
				float temp_output_79_0_g301 = temp_output_48_0_g297;
				float lerpResult64_g301 = lerp( tex2DNode36_g297.a , tex2DNode36_g297.r , temp_output_79_0_g301);
				float clampResult68_g301 = clamp( ( temp_output_79_0_g301 - 1.0 ) , 0.0 , 1.0 );
				float lerpResult66_g301 = lerp( lerpResult64_g301 , tex2DNode36_g297.g , clampResult68_g301);
				float clampResult70_g301 = clamp( ( temp_output_79_0_g301 - 2.0 ) , 0.0 , 1.0 );
				float lerpResult69_g301 = lerp( lerpResult66_g301 , tex2DNode36_g297.b , clampResult70_g301);
				float temp_output_39_0_g297 = lerpResult69_g301;
				float lerpResult62_g297 = lerp( ( temp_output_28_0_g297 * temp_output_39_0_g297 ) , ( temp_output_28_0_g297 + temp_output_39_0_g297 ) , temp_output_65_0_g297);
				float4 texCoord1_g282 = i.ase_texcoord2;
				texCoord1_g282.xy = i.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float custom_noise691 = _custom_noises;
				float temp_output_5_0_g282 = custom_noise691;
				float lerpResult2_g282 = lerp( texCoord1_g282.x , texCoord1_g282.y , temp_output_5_0_g282);
				float lerpResult6_g282 = lerp( lerpResult2_g282 , texCoord1_g282.z , saturate( ( temp_output_5_0_g282 - 1.0 ) ));
				float lerpResult11_g282 = lerp( lerpResult6_g282 , texCoord1_g282.w , saturate( ( temp_output_5_0_g282 - 2.0 ) ));
				float4 texCoord15_g282 = i.ase_texcoord4;
				texCoord15_g282.xy = i.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult13_g282 = lerp( lerpResult11_g282 , texCoord15_g282.x , saturate( ( temp_output_5_0_g282 - 3.0 ) ));
				float lerpResult17_g282 = lerp( lerpResult13_g282 , texCoord15_g282.y , saturate( ( temp_output_5_0_g282 - 4.0 ) ));
				float lerpResult20_g282 = lerp( lerpResult17_g282 , texCoord15_g282.z , saturate( ( temp_output_5_0_g282 - 5.0 ) ));
				float lerpResult23_g282 = lerp( lerpResult20_g282 , texCoord15_g282.w , saturate( ( temp_output_5_0_g282 - 6.0 ) ));
				float toogle_custom_noise696 = _customtoogle_noisescale;
				float lerpResult544 = lerp( _noise_intensity_sub , ( _noise_intensity_sub * lerpResult23_g282 ) , toogle_custom_noise696);
				float temp_output_12_0_g297 = ( lerpResult544 * 0.1 );
				float3 appendResult14_g297 = (float3(1.0 , 0.0 , ( ( lerpResult58_g297 - lerpResult62_g297 ) * temp_output_12_0_g297 * 0.1 )));
				float2 appendResult7_g297 = (float2(break20_g297.x , ( break20_g297.y + temp_output_3_0_g297 )));
				float4 tex2DNode4_g297 = tex2D( _noise, appendResult7_g297 );
				float temp_output_79_0_g300 = temp_output_32_0_g297;
				float lerpResult64_g300 = lerp( tex2DNode4_g297.a , tex2DNode4_g297.r , temp_output_79_0_g300);
				float clampResult68_g300 = clamp( ( temp_output_79_0_g300 - 1.0 ) , 0.0 , 1.0 );
				float lerpResult66_g300 = lerp( lerpResult64_g300 , tex2DNode4_g297.g , clampResult68_g300);
				float clampResult70_g300 = clamp( ( temp_output_79_0_g300 - 2.0 ) , 0.0 , 1.0 );
				float lerpResult69_g300 = lerp( lerpResult66_g300 , tex2DNode4_g297.b , clampResult70_g300);
				float temp_output_30_0_g297 = lerpResult69_g300;
				float2 appendResult46_g297 = (float2(break43_g297.x , ( break43_g297.y + temp_output_42_0_g297 )));
				float4 tex2DNode38_g297 = tex2D( _noisemask, appendResult46_g297 );
				float temp_output_79_0_g303 = temp_output_48_0_g297;
				float lerpResult64_g303 = lerp( tex2DNode38_g297.a , tex2DNode38_g297.r , temp_output_79_0_g303);
				float clampResult68_g303 = clamp( ( temp_output_79_0_g303 - 1.0 ) , 0.0 , 1.0 );
				float lerpResult66_g303 = lerp( lerpResult64_g303 , tex2DNode38_g297.g , clampResult68_g303);
				float clampResult70_g303 = clamp( ( temp_output_79_0_g303 - 2.0 ) , 0.0 , 1.0 );
				float lerpResult69_g303 = lerp( lerpResult66_g303 , tex2DNode38_g297.b , clampResult70_g303);
				float temp_output_41_0_g297 = lerpResult69_g303;
				float lerpResult63_g297 = lerp( ( temp_output_30_0_g297 * temp_output_41_0_g297 ) , ( temp_output_30_0_g297 + temp_output_41_0_g297 ) , temp_output_65_0_g297);
				float3 appendResult19_g297 = (float3(0.0 , 1.0 , ( ( lerpResult63_g297 - lerpResult62_g297 ) * temp_output_12_0_g297 * 0.1 )));
				float3 normalizeResult22_g297 = normalize( cross( appendResult14_g297 , appendResult19_g297 ) );
				float3 noise_sub395 = normalizeResult22_g297;
				float4 tex2DNode109 = tex2D( _subtex, ( float3( lerpResult67_g313 ,  0.0 ) + noise_sub395 ).xy );
				float3 temp_output_39_0_g393 = tex2DNode109.rgb;
				float2 appendResult38 = (float2(_speed_skew_maintex.x , _speed_skew_maintex.y));
				float2 lerpResult20 = lerp( i.ase_texcoord1.xyz.xy , i.ase_texcoord2.xy , _uv_maintex);
				float2 appendResult24 = (float2(ase_grabScreenPosNorm.r , ase_grabScreenPosNorm.g));
				float2 lerpResult22 = lerp( lerpResult20 , appendResult24 , saturate( ( _uv_maintex - 1.0 ) ));
				float2 lerpResult973 = lerp( lerpResult22 , flowmapuv969 , flowmap_intensity971);
				float2 lerpResult984 = lerp( lerpResult22 , lerpResult973 , _flowmaptoggle_main);
				float2 temp_output_51_0_g280 = lerpResult984;
				float2 temp_output_34_0_g281 = ( temp_output_51_0_g280 - float2( 0.5,0.5 ) );
				float2 break39_g281 = temp_output_34_0_g281;
				float2 appendResult50_g281 = (float2(( 1.0 * ( length( temp_output_34_0_g281 ) * 2.0 ) ) , ( ( atan2( break39_g281.x , break39_g281.y ) * ( 1.0 / 6.28318548202515 ) ) * 1.0 )));
				float2 lerpResult14_g280 = lerp( temp_output_51_0_g280 , appendResult50_g281 , _polar_maintex);
				float3 appendResult11_g280 = (float3(1.0 , _speed_skew_maintex.z , 0.0));
				float3 appendResult9_g280 = (float3(_speed_skew_maintex.w , 1.0 , 0.0));
				float2 temp_cast_36 = (0.5).xx;
				float cos18_g280 = cos( ( _rotate_maintex * UNITY_PI ) );
				float sin18_g280 = sin( ( _rotate_maintex * UNITY_PI ) );
				float2 rotator18_g280 = mul( mul( float3( lerpResult14_g280 ,  0.0 ), float3x3(appendResult11_g280, appendResult9_g280, float3(0,0,1)) ).xy - temp_cast_36 , float2x2( cos18_g280 , -sin18_g280 , sin18_g280 , cos18_g280 )) + temp_cast_36;
				float2 panner20_g280 = ( 1.0 * _Time.y * appendResult38 + rotator18_g280);
				float2 temp_cast_37 = (0.5).xx;
				float2 appendResult30 = (float2(_maintex_ST.x , _maintex_ST.y));
				float2 appendResult31 = (float2(_maintex_ST.z , _maintex_ST.w));
				float4 texCoord1_g274 = i.ase_texcoord2;
				texCoord1_g274.xy = i.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_5_0_g274 = _custommainx;
				float lerpResult2_g274 = lerp( texCoord1_g274.x , texCoord1_g274.y , temp_output_5_0_g274);
				float lerpResult6_g274 = lerp( lerpResult2_g274 , texCoord1_g274.z , saturate( ( temp_output_5_0_g274 - 1.0 ) ));
				float lerpResult11_g274 = lerp( lerpResult6_g274 , texCoord1_g274.w , saturate( ( temp_output_5_0_g274 - 2.0 ) ));
				float4 texCoord15_g274 = i.ase_texcoord4;
				texCoord15_g274.xy = i.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult13_g274 = lerp( lerpResult11_g274 , texCoord15_g274.x , saturate( ( temp_output_5_0_g274 - 3.0 ) ));
				float lerpResult17_g274 = lerp( lerpResult13_g274 , texCoord15_g274.y , saturate( ( temp_output_5_0_g274 - 4.0 ) ));
				float lerpResult20_g274 = lerp( lerpResult17_g274 , texCoord15_g274.z , saturate( ( temp_output_5_0_g274 - 5.0 ) ));
				float lerpResult23_g274 = lerp( lerpResult20_g274 , texCoord15_g274.w , saturate( ( temp_output_5_0_g274 - 6.0 ) ));
				float4 texCoord1_g273 = i.ase_texcoord2;
				texCoord1_g273.xy = i.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_5_0_g273 = _custommainy;
				float lerpResult2_g273 = lerp( texCoord1_g273.x , texCoord1_g273.y , temp_output_5_0_g273);
				float lerpResult6_g273 = lerp( lerpResult2_g273 , texCoord1_g273.z , saturate( ( temp_output_5_0_g273 - 1.0 ) ));
				float lerpResult11_g273 = lerp( lerpResult6_g273 , texCoord1_g273.w , saturate( ( temp_output_5_0_g273 - 2.0 ) ));
				float4 texCoord15_g273 = i.ase_texcoord4;
				texCoord15_g273.xy = i.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult13_g273 = lerp( lerpResult11_g273 , texCoord15_g273.x , saturate( ( temp_output_5_0_g273 - 3.0 ) ));
				float lerpResult17_g273 = lerp( lerpResult13_g273 , texCoord15_g273.y , saturate( ( temp_output_5_0_g273 - 4.0 ) ));
				float lerpResult20_g273 = lerp( lerpResult17_g273 , texCoord15_g273.z , saturate( ( temp_output_5_0_g273 - 5.0 ) ));
				float lerpResult23_g273 = lerp( lerpResult20_g273 , texCoord15_g273.w , saturate( ( temp_output_5_0_g273 - 6.0 ) ));
				float2 appendResult100 = (float2(lerpResult23_g274 , lerpResult23_g273));
				float2 lerpResult94 = lerp( appendResult31 , appendResult100 , _customtoogle_mainoffset);
				float2 break54_g280 = (( ( ( panner20_g280 - temp_cast_37 ) * _scale_maintex ) + 0.5 )*appendResult30 + lerpResult94);
				float clampResult55_g280 = clamp( break54_g280.x , 0.0 , 1.0 );
				float lerpResult58_g280 = lerp( break54_g280.x , clampResult55_g280 , _clampx_maintex);
				float clampResult56_g280 = clamp( break54_g280.y , 0.0 , 1.0 );
				float lerpResult59_g280 = lerp( break54_g280.y , clampResult56_g280 , _clampy_maintex);
				float2 appendResult57_g280 = (float2(lerpResult58_g280 , lerpResult59_g280));
				float div68_g280=256.0/float((int)( 1.0 + _posterize ));
				float4 posterize68_g280 = ( floor( float4( (appendResult57_g280).xy, 0.0 , 0.0 ) * div68_g280 ) / div68_g280 );
				float2 lerpResult67_g280 = lerp( appendResult57_g280 , (posterize68_g280).rg , _posterizetoogle_maintex);
				float2 temp_output_91_0 = lerpResult67_g280;
				float2 uv_mantex855 = temp_output_91_0;
				float3 ase_viewVectorTS =  tanToWorld0 * ( _WorldSpaceCameraPos.xyz - WorldPosition ).x + tanToWorld1 * ( _WorldSpaceCameraPos.xyz - WorldPosition ).y  + tanToWorld2 * ( _WorldSpaceCameraPos.xyz - WorldPosition ).z;
				float3 ase_viewDirTS = normalize( ase_viewVectorTS );
				float2 OffsetPOM854 = POM( _parallaxmap, uv_mantex855, ddx(uv_mantex855), ddy(uv_mantex855), ase_normalWS, ase_viewDirWS, ase_viewDirTS, 128, 128, 10, ( _parallax_scale * 0.1 ), 0, _parallaxmap_ST.xy, float2(0,0), 0 );
				float2 parallax862 = OffsetPOM854;
				float2 lerpResult871 = lerp( temp_output_91_0 , parallax862 , _toggle_parallax);
				float2 temp_output_24_0_g290 = noiseuv659;
				float2 break20_g290 = temp_output_24_0_g290;
				float temp_output_11_0_g290 = noise_offset686;
				float temp_output_3_0_g290 = ( pow( temp_output_11_0_g290 , 3.0 ) * 0.1 );
				float2 appendResult23_g290 = (float2(( break20_g290.x + temp_output_3_0_g290 ) , break20_g290.y));
				float4 tex2DNode5_g290 = tex2D( _noise, appendResult23_g290 );
				float temp_output_32_0_g290 = noisetex_alpha652;
				float temp_output_79_0_g292 = temp_output_32_0_g290;
				float lerpResult64_g292 = lerp( tex2DNode5_g290.a , tex2DNode5_g290.r , temp_output_79_0_g292);
				float clampResult68_g292 = clamp( ( temp_output_79_0_g292 - 1.0 ) , 0.0 , 1.0 );
				float lerpResult66_g292 = lerp( lerpResult64_g292 , tex2DNode5_g290.g , clampResult68_g292);
				float clampResult70_g292 = clamp( ( temp_output_79_0_g292 - 2.0 ) , 0.0 , 1.0 );
				float lerpResult69_g292 = lerp( lerpResult66_g292 , tex2DNode5_g290.b , clampResult70_g292);
				float temp_output_29_0_g290 = lerpResult69_g292;
				float2 temp_output_49_0_g290 = noisemaskuv665;
				float2 break43_g290 = temp_output_49_0_g290;
				float temp_output_42_0_g290 = ( pow( temp_output_11_0_g290 , 3.0 ) * 0.1 );
				float2 appendResult45_g290 = (float2(( break43_g290.x + temp_output_42_0_g290 ) , break43_g290.y));
				float4 tex2DNode37_g290 = tex2D( _noisemask, appendResult45_g290 );
				float temp_output_48_0_g290 = noisemask_alpha670;
				float temp_output_79_0_g295 = temp_output_48_0_g290;
				float lerpResult64_g295 = lerp( tex2DNode37_g290.a , tex2DNode37_g290.r , temp_output_79_0_g295);
				float clampResult68_g295 = clamp( ( temp_output_79_0_g295 - 1.0 ) , 0.0 , 1.0 );
				float lerpResult66_g295 = lerp( lerpResult64_g295 , tex2DNode37_g290.g , clampResult68_g295);
				float clampResult70_g295 = clamp( ( temp_output_79_0_g295 - 2.0 ) , 0.0 , 1.0 );
				float lerpResult69_g295 = lerp( lerpResult66_g295 , tex2DNode37_g290.b , clampResult70_g295);
				float temp_output_40_0_g290 = lerpResult69_g295;
				float temp_output_65_0_g290 = noisemask_mode681;
				float lerpResult58_g290 = lerp( ( temp_output_29_0_g290 * temp_output_40_0_g290 ) , ( temp_output_29_0_g290 + temp_output_40_0_g290 ) , temp_output_65_0_g290);
				float4 tex2DNode6_g290 = tex2D( _noise, temp_output_24_0_g290 );
				float temp_output_79_0_g291 = temp_output_32_0_g290;
				float lerpResult64_g291 = lerp( tex2DNode6_g290.a , tex2DNode6_g290.r , temp_output_79_0_g291);
				float clampResult68_g291 = clamp( ( temp_output_79_0_g291 - 1.0 ) , 0.0 , 1.0 );
				float lerpResult66_g291 = lerp( lerpResult64_g291 , tex2DNode6_g290.g , clampResult68_g291);
				float clampResult70_g291 = clamp( ( temp_output_79_0_g291 - 2.0 ) , 0.0 , 1.0 );
				float lerpResult69_g291 = lerp( lerpResult66_g291 , tex2DNode6_g290.b , clampResult70_g291);
				float temp_output_28_0_g290 = lerpResult69_g291;
				float4 tex2DNode36_g290 = tex2D( _noisemask, temp_output_49_0_g290 );
				float temp_output_79_0_g294 = temp_output_48_0_g290;
				float lerpResult64_g294 = lerp( tex2DNode36_g290.a , tex2DNode36_g290.r , temp_output_79_0_g294);
				float clampResult68_g294 = clamp( ( temp_output_79_0_g294 - 1.0 ) , 0.0 , 1.0 );
				float lerpResult66_g294 = lerp( lerpResult64_g294 , tex2DNode36_g290.g , clampResult68_g294);
				float clampResult70_g294 = clamp( ( temp_output_79_0_g294 - 2.0 ) , 0.0 , 1.0 );
				float lerpResult69_g294 = lerp( lerpResult66_g294 , tex2DNode36_g290.b , clampResult70_g294);
				float temp_output_39_0_g290 = lerpResult69_g294;
				float lerpResult62_g290 = lerp( ( temp_output_28_0_g290 * temp_output_39_0_g290 ) , ( temp_output_28_0_g290 + temp_output_39_0_g290 ) , temp_output_65_0_g290);
				float4 texCoord1_g279 = i.ase_texcoord2;
				texCoord1_g279.xy = i.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_5_0_g279 = custom_noise691;
				float lerpResult2_g279 = lerp( texCoord1_g279.x , texCoord1_g279.y , temp_output_5_0_g279);
				float lerpResult6_g279 = lerp( lerpResult2_g279 , texCoord1_g279.z , saturate( ( temp_output_5_0_g279 - 1.0 ) ));
				float lerpResult11_g279 = lerp( lerpResult6_g279 , texCoord1_g279.w , saturate( ( temp_output_5_0_g279 - 2.0 ) ));
				float4 texCoord15_g279 = i.ase_texcoord4;
				texCoord15_g279.xy = i.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult13_g279 = lerp( lerpResult11_g279 , texCoord15_g279.x , saturate( ( temp_output_5_0_g279 - 3.0 ) ));
				float lerpResult17_g279 = lerp( lerpResult13_g279 , texCoord15_g279.y , saturate( ( temp_output_5_0_g279 - 4.0 ) ));
				float lerpResult20_g279 = lerp( lerpResult17_g279 , texCoord15_g279.z , saturate( ( temp_output_5_0_g279 - 5.0 ) ));
				float lerpResult23_g279 = lerp( lerpResult20_g279 , texCoord15_g279.w , saturate( ( temp_output_5_0_g279 - 6.0 ) ));
				float lerpResult535 = lerp( _noise_intensity_main , ( _noise_intensity_main * lerpResult23_g279 ) , toogle_custom_noise696);
				float temp_output_12_0_g290 = ( lerpResult535 * 0.1 );
				float3 appendResult14_g290 = (float3(1.0 , 0.0 , ( ( lerpResult58_g290 - lerpResult62_g290 ) * temp_output_12_0_g290 * 0.1 )));
				float2 appendResult7_g290 = (float2(break20_g290.x , ( break20_g290.y + temp_output_3_0_g290 )));
				float4 tex2DNode4_g290 = tex2D( _noise, appendResult7_g290 );
				float temp_output_79_0_g293 = temp_output_32_0_g290;
				float lerpResult64_g293 = lerp( tex2DNode4_g290.a , tex2DNode4_g290.r , temp_output_79_0_g293);
				float clampResult68_g293 = clamp( ( temp_output_79_0_g293 - 1.0 ) , 0.0 , 1.0 );
				float lerpResult66_g293 = lerp( lerpResult64_g293 , tex2DNode4_g290.g , clampResult68_g293);
				float clampResult70_g293 = clamp( ( temp_output_79_0_g293 - 2.0 ) , 0.0 , 1.0 );
				float lerpResult69_g293 = lerp( lerpResult66_g293 , tex2DNode4_g290.b , clampResult70_g293);
				float temp_output_30_0_g290 = lerpResult69_g293;
				float2 appendResult46_g290 = (float2(break43_g290.x , ( break43_g290.y + temp_output_42_0_g290 )));
				float4 tex2DNode38_g290 = tex2D( _noisemask, appendResult46_g290 );
				float temp_output_79_0_g296 = temp_output_48_0_g290;
				float lerpResult64_g296 = lerp( tex2DNode38_g290.a , tex2DNode38_g290.r , temp_output_79_0_g296);
				float clampResult68_g296 = clamp( ( temp_output_79_0_g296 - 1.0 ) , 0.0 , 1.0 );
				float lerpResult66_g296 = lerp( lerpResult64_g296 , tex2DNode38_g290.g , clampResult68_g296);
				float clampResult70_g296 = clamp( ( temp_output_79_0_g296 - 2.0 ) , 0.0 , 1.0 );
				float lerpResult69_g296 = lerp( lerpResult66_g296 , tex2DNode38_g290.b , clampResult70_g296);
				float temp_output_41_0_g290 = lerpResult69_g296;
				float lerpResult63_g290 = lerp( ( temp_output_30_0_g290 * temp_output_41_0_g290 ) , ( temp_output_30_0_g290 + temp_output_41_0_g290 ) , temp_output_65_0_g290);
				float3 appendResult19_g290 = (float3(0.0 , 1.0 , ( ( lerpResult63_g290 - lerpResult62_g290 ) * temp_output_12_0_g290 * 0.1 )));
				float3 normalizeResult22_g290 = normalize( cross( appendResult14_g290 , appendResult19_g290 ) );
				float3 noise_main393 = normalizeResult22_g290;
				float3 temp_output_397_0 = ( float3( lerpResult871 ,  0.0 ) + noise_main393 );
				float2 temp_output_76_0 = ( 0.01 * _sesan );
				float4 tex2DNode17 = tex2D( _maintex, temp_output_397_0.xy );
				float3 appendResult72 = (float3(tex2D( _maintex, ( temp_output_397_0 + float3( temp_output_76_0 ,  0.0 ) ).xy ).r , tex2DNode17.g , tex2D( _maintex, ( temp_output_397_0 - float3( temp_output_76_0 ,  0.0 ) ).xy ).b));
				float2 temp_output_29_0_g391 = i.ase_texcoord1.xyz.xy;
				float loopflow_speed1042 = _loopflow_speed;
				float mulTime3_g391 = _Time.y * loopflow_speed1042;
				float temp_output_8_0_g391 = frac( mulTime3_g391 );
				float2 temp_output_7_0_g391 = (flowmapuv969*2.0 + -1.0);
				float loopflow_strength1041 = _loopflow_strength;
				float temp_output_25_0_g391 = loopflow_strength1041;
				float4 lerpResult16_g391 = lerp( tex2D( _maintex, ( temp_output_29_0_g391 + ( temp_output_8_0_g391 * temp_output_7_0_g391 * temp_output_25_0_g391 ) ) ) , tex2D( _maintex, ( temp_output_29_0_g391 + ( temp_output_7_0_g391 * temp_output_25_0_g391 * frac( ( mulTime3_g391 + 0.5 ) ) ) ) ) , abs( (temp_output_8_0_g391*2.0 + -1.0) ));
				float4 lerpResult1049 = lerp( float4( appendResult72 , 0.0 ) , lerpResult16_g391 , _toogele_loopflow);
				float3 desaturateInitialColor79 = lerpResult1049.rgb;
				float desaturateDot79 = dot( desaturateInitialColor79, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar79 = lerp( desaturateInitialColor79, desaturateDot79.xxx, _desature );
				float3 saferPower47 = abs( desaturateVar79 );
				float3 temp_cast_50 = (_refiene_power).xxx;
				float3 lerpResult51 = lerp( ( saturate( pow( saferPower47 , temp_cast_50 ) ) * _refiene_intensity ) , desaturateVar79 , _refine_lerp);
				float temp_output_79_0_g368 = _alpha_maintex;
				float lerpResult64_g368 = lerp( tex2DNode17.a , tex2DNode17.r , temp_output_79_0_g368);
				float clampResult68_g368 = clamp( ( temp_output_79_0_g368 - 1.0 ) , 0.0 , 1.0 );
				float lerpResult66_g368 = lerp( lerpResult64_g368 , tex2DNode17.g , clampResult68_g368);
				float clampResult70_g368 = clamp( ( temp_output_79_0_g368 - 2.0 ) , 0.0 , 1.0 );
				float lerpResult69_g368 = lerp( lerpResult66_g368 , tex2DNode17.b , clampResult70_g368);
				float temp_output_44_0 = lerpResult69_g368;
				float3 lerpResult875 = lerp( _parallax_outcolor.rgb , ( lerpResult51 * _parallax_intcolor.rgb ) , temp_output_44_0);
				float3 lerpResult882 = lerp( lerpResult51 , lerpResult875 , _toggle_parallax);
				float3 temp_output_40_0_g393 = lerpResult882;
				float3 blendOpSrc79_g393 = temp_output_39_0_g393;
				float3 blendOpDest79_g393 = temp_output_40_0_g393;
				float temp_output_43_0_g393 = _blend;
				float3 lerpBlendMode79_g393 = lerp(blendOpDest79_g393,( blendOpDest79_g393/ max( 1.0 - blendOpSrc79_g393, 0.00001 ) ),temp_output_43_0_g393);
				float3 blendOpSrc7_g393 = temp_output_39_0_g393;
				float3 blendOpDest7_g393 = temp_output_40_0_g393;
				float3 lerpBlendMode7_g393 = lerp(blendOpDest7_g393,( blendOpSrc7_g393 + blendOpDest7_g393 ),temp_output_43_0_g393);
				float temp_output_44_0_g393 = _texblendmode;
				float3 lerpResult80_g393 = lerp( ( saturate( lerpBlendMode79_g393 )) , lerpBlendMode7_g393 , temp_output_44_0_g393);
				float3 blendOpSrc12_g393 = temp_output_39_0_g393;
				float3 blendOpDest12_g393 = temp_output_40_0_g393;
				float3 lerpBlendMode12_g393 = lerp(blendOpDest12_g393,2.0f*blendOpDest12_g393*blendOpSrc12_g393 + blendOpDest12_g393*blendOpDest12_g393*(1.0f - 2.0f*blendOpSrc12_g393),temp_output_43_0_g393);
				float3 lerpResult81_g393 = lerp( lerpResult80_g393 , lerpBlendMode12_g393 , saturate( ( temp_output_44_0_g393 - 1.0 ) ));
				float3 blendOpSrc14_g393 = temp_output_39_0_g393;
				float3 blendOpDest14_g393 = temp_output_40_0_g393;
				float3 lerpBlendMode14_g393 = lerp(blendOpDest14_g393,( blendOpSrc14_g393 * blendOpDest14_g393 ),temp_output_43_0_g393);
				float3 lerpResult82_g393 = lerp( lerpResult81_g393 , lerpBlendMode14_g393 , saturate( ( temp_output_44_0_g393 - 2.0 ) ));
				float3 blendOpSrc15_g393 = temp_output_39_0_g393;
				float3 blendOpDest15_g393 = temp_output_40_0_g393;
				float3 lerpBlendMode15_g393 = lerp(blendOpDest15_g393,( 1.0 - ( 1.0 - blendOpSrc15_g393 ) * ( 1.0 - blendOpDest15_g393 ) ),temp_output_43_0_g393);
				float3 lerpResult83_g393 = lerp( lerpResult82_g393 , lerpBlendMode15_g393 , saturate( ( temp_output_44_0_g393 - 3.0 ) ));
				float3 blendOpSrc18_g393 = temp_output_39_0_g393;
				float3 blendOpDest18_g393 = temp_output_40_0_g393;
				float3 lerpBlendMode18_g393 = lerp(blendOpDest18_g393,(( blendOpDest18_g393 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest18_g393 ) * ( 1.0 - blendOpSrc18_g393 ) ) : ( 2.0 * blendOpDest18_g393 * blendOpSrc18_g393 ) ),temp_output_43_0_g393);
				float3 lerpResult84_g393 = lerp( lerpResult83_g393 , lerpBlendMode18_g393 , saturate( ( temp_output_44_0_g393 - 4.0 ) ));
				float2 appendResult1215 = (float2(_rampspeed , 0.0));
				float temp_output_79_0_g369 = _alpha_subtex;
				float lerpResult64_g369 = lerp( tex2DNode109.a , tex2DNode109.r , temp_output_79_0_g369);
				float clampResult68_g369 = clamp( ( temp_output_79_0_g369 - 1.0 ) , 0.0 , 1.0 );
				float lerpResult66_g369 = lerp( lerpResult64_g369 , tex2DNode109.g , clampResult68_g369);
				float clampResult70_g369 = clamp( ( temp_output_79_0_g369 - 2.0 ) , 0.0 , 1.0 );
				float lerpResult69_g369 = lerp( lerpResult66_g369 , tex2DNode109.b , clampResult70_g369);
				float temp_output_140_0 = lerpResult69_g369;
				float temp_output_79_0_g387 = _texblendalphaswitch;
				float lerpResult64_g387 = lerp( temp_output_44_0 , temp_output_140_0 , temp_output_79_0_g387);
				float clampResult68_g387 = clamp( ( temp_output_79_0_g387 - 1.0 ) , 0.0 , 1.0 );
				float lerpResult66_g387 = lerp( lerpResult64_g387 , ( temp_output_44_0 + temp_output_140_0 ) , clampResult68_g387);
				float clampResult70_g387 = clamp( ( temp_output_79_0_g387 - 2.0 ) , 0.0 , 1.0 );
				float lerpResult69_g387 = lerp( lerpResult66_g387 , ( temp_output_44_0 * temp_output_140_0 ) , clampResult70_g387);
				float temp_output_152_0 = lerpResult69_g387;
				float3 normalizedWorldNormal = normalize( ase_normalWS );
				float3 ase_viewDirSafeWS = Unity_SafeNormalize( ase_viewVectorWS );
				float dotResult920 = dot( normalizedWorldNormal , ase_viewDirSafeWS );
				float temp_output_922_0 = saturate( abs( dotResult920 ) );
				float lerpResult779 = lerp( ( 1.0 - temp_output_922_0 ) , temp_output_922_0 , _invertfresnel);
				float temp_output_775_0 = saturate( ( pow( lerpResult779 , _fresnelpower ) * _fresnelscale ) );
				float fresnel794 = temp_output_775_0;
				float lerpResult827 = lerp( ( temp_output_152_0 * fresnel794 ) , saturate( ( temp_output_152_0 + fresnel794 ) ) , _fresnelmode);
				float lerpResult829 = lerp( temp_output_152_0 , lerpResult827 , _toggle_fresnel);
				float2 appendResult190 = (float2(_speed_skew_mask.x , _speed_skew_mask.y));
				float2 lerpResult175 = lerp( i.ase_texcoord1.xyz.xy , i.ase_texcoord2.xy , _uv_mask);
				float2 appendResult176 = (float2(ase_grabScreenPosNorm.r , ase_grabScreenPosNorm.g));
				float2 lerpResult187 = lerp( lerpResult175 , appendResult176 , saturate( ( _uv_mask - 1.0 ) ));
				float2 lerpResult979 = lerp( lerpResult187 , flowmapuv969 , flowmap_intensity971);
				float2 lerpResult990 = lerp( lerpResult187 , lerpResult979 , _flowmaptoggle_mask);
				float2 temp_output_51_0_g388 = lerpResult990;
				float2 temp_output_34_0_g389 = ( temp_output_51_0_g388 - float2( 0.5,0.5 ) );
				float2 break39_g389 = temp_output_34_0_g389;
				float2 appendResult50_g389 = (float2(( 1.0 * ( length( temp_output_34_0_g389 ) * 2.0 ) ) , ( ( atan2( break39_g389.x , break39_g389.y ) * ( 1.0 / 6.28318548202515 ) ) * 1.0 )));
				float2 lerpResult14_g388 = lerp( temp_output_51_0_g388 , appendResult50_g389 , _polar_mask);
				float3 appendResult11_g388 = (float3(1.0 , _speed_skew_mask.z , 0.0));
				float3 appendResult9_g388 = (float3(_speed_skew_mask.w , 1.0 , 0.0));
				float2 temp_cast_53 = (0.5).xx;
				float cos18_g388 = cos( ( _rotate_mask * UNITY_PI ) );
				float sin18_g388 = sin( ( _rotate_mask * UNITY_PI ) );
				float2 rotator18_g388 = mul( mul( float3( lerpResult14_g388 ,  0.0 ), float3x3(appendResult11_g388, appendResult9_g388, float3(0,0,1)) ).xy - temp_cast_53 , float2x2( cos18_g388 , -sin18_g388 , sin18_g388 , cos18_g388 )) + temp_cast_53;
				float2 panner20_g388 = ( 1.0 * _Time.y * appendResult190 + rotator18_g388);
				float2 temp_cast_54 = (0.5).xx;
				float2 appendResult188 = (float2(_mask_ST.x , _mask_ST.y));
				float2 appendResult177 = (float2(_mask_ST.z , _mask_ST.w));
				float4 texCoord1_g373 = i.ase_texcoord2;
				texCoord1_g373.xy = i.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_5_0_g373 = _custommaskx;
				float lerpResult2_g373 = lerp( texCoord1_g373.x , texCoord1_g373.y , temp_output_5_0_g373);
				float lerpResult6_g373 = lerp( lerpResult2_g373 , texCoord1_g373.z , saturate( ( temp_output_5_0_g373 - 1.0 ) ));
				float lerpResult11_g373 = lerp( lerpResult6_g373 , texCoord1_g373.w , saturate( ( temp_output_5_0_g373 - 2.0 ) ));
				float4 texCoord15_g373 = i.ase_texcoord4;
				texCoord15_g373.xy = i.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult13_g373 = lerp( lerpResult11_g373 , texCoord15_g373.x , saturate( ( temp_output_5_0_g373 - 3.0 ) ));
				float lerpResult17_g373 = lerp( lerpResult13_g373 , texCoord15_g373.y , saturate( ( temp_output_5_0_g373 - 4.0 ) ));
				float lerpResult20_g373 = lerp( lerpResult17_g373 , texCoord15_g373.z , saturate( ( temp_output_5_0_g373 - 5.0 ) ));
				float lerpResult23_g373 = lerp( lerpResult20_g373 , texCoord15_g373.w , saturate( ( temp_output_5_0_g373 - 6.0 ) ));
				float4 texCoord1_g372 = i.ase_texcoord2;
				texCoord1_g372.xy = i.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_5_0_g372 = _custommasky;
				float lerpResult2_g372 = lerp( texCoord1_g372.x , texCoord1_g372.y , temp_output_5_0_g372);
				float lerpResult6_g372 = lerp( lerpResult2_g372 , texCoord1_g372.z , saturate( ( temp_output_5_0_g372 - 1.0 ) ));
				float lerpResult11_g372 = lerp( lerpResult6_g372 , texCoord1_g372.w , saturate( ( temp_output_5_0_g372 - 2.0 ) ));
				float4 texCoord15_g372 = i.ase_texcoord4;
				texCoord15_g372.xy = i.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult13_g372 = lerp( lerpResult11_g372 , texCoord15_g372.x , saturate( ( temp_output_5_0_g372 - 3.0 ) ));
				float lerpResult17_g372 = lerp( lerpResult13_g372 , texCoord15_g372.y , saturate( ( temp_output_5_0_g372 - 4.0 ) ));
				float lerpResult20_g372 = lerp( lerpResult17_g372 , texCoord15_g372.z , saturate( ( temp_output_5_0_g372 - 5.0 ) ));
				float lerpResult23_g372 = lerp( lerpResult20_g372 , texCoord15_g372.w , saturate( ( temp_output_5_0_g372 - 6.0 ) ));
				float2 appendResult178 = (float2(lerpResult23_g373 , lerpResult23_g372));
				float2 lerpResult189 = lerp( appendResult177 , appendResult178 , _customtoogle_maskoffset);
				float2 break54_g388 = (( ( ( panner20_g388 - temp_cast_54 ) * _scale_Mask ) + 0.5 )*appendResult188 + lerpResult189);
				float clampResult55_g388 = clamp( break54_g388.x , 0.0 , 1.0 );
				float lerpResult58_g388 = lerp( break54_g388.x , clampResult55_g388 , _clampx_mask);
				float clampResult56_g388 = clamp( break54_g388.y , 0.0 , 1.0 );
				float lerpResult59_g388 = lerp( break54_g388.y , clampResult56_g388 , _clampy_mask);
				float2 appendResult57_g388 = (float2(lerpResult58_g388 , lerpResult59_g388));
				float div68_g388=256.0/float((int)( 1.0 + _posterize_mask ));
				float4 posterize68_g388 = ( floor( float4( (appendResult57_g388).xy, 0.0 , 0.0 ) * div68_g388 ) / div68_g388 );
				float2 lerpResult67_g388 = lerp( appendResult57_g388 , (posterize68_g388).rg , _posterizetoogle_mask);
				float2 temp_output_24_0_g380 = noiseuv659;
				float2 break20_g380 = temp_output_24_0_g380;
				float temp_output_11_0_g380 = noise_offset686;
				float temp_output_3_0_g380 = ( pow( temp_output_11_0_g380 , 3.0 ) * 0.1 );
				float2 appendResult23_g380 = (float2(( break20_g380.x + temp_output_3_0_g380 ) , break20_g380.y));
				float4 tex2DNode5_g380 = tex2D( _noise, appendResult23_g380 );
				float temp_output_32_0_g380 = noisetex_alpha652;
				float temp_output_79_0_g382 = temp_output_32_0_g380;
				float lerpResult64_g382 = lerp( tex2DNode5_g380.a , tex2DNode5_g380.r , temp_output_79_0_g382);
				float clampResult68_g382 = clamp( ( temp_output_79_0_g382 - 1.0 ) , 0.0 , 1.0 );
				float lerpResult66_g382 = lerp( lerpResult64_g382 , tex2DNode5_g380.g , clampResult68_g382);
				float clampResult70_g382 = clamp( ( temp_output_79_0_g382 - 2.0 ) , 0.0 , 1.0 );
				float lerpResult69_g382 = lerp( lerpResult66_g382 , tex2DNode5_g380.b , clampResult70_g382);
				float temp_output_29_0_g380 = lerpResult69_g382;
				float2 temp_output_49_0_g380 = noisemaskuv665;
				float2 break43_g380 = temp_output_49_0_g380;
				float temp_output_42_0_g380 = ( pow( temp_output_11_0_g380 , 3.0 ) * 0.1 );
				float2 appendResult45_g380 = (float2(( break43_g380.x + temp_output_42_0_g380 ) , break43_g380.y));
				float4 tex2DNode37_g380 = tex2D( _noisemask, appendResult45_g380 );
				float temp_output_48_0_g380 = noisemask_alpha670;
				float temp_output_79_0_g385 = temp_output_48_0_g380;
				float lerpResult64_g385 = lerp( tex2DNode37_g380.a , tex2DNode37_g380.r , temp_output_79_0_g385);
				float clampResult68_g385 = clamp( ( temp_output_79_0_g385 - 1.0 ) , 0.0 , 1.0 );
				float lerpResult66_g385 = lerp( lerpResult64_g385 , tex2DNode37_g380.g , clampResult68_g385);
				float clampResult70_g385 = clamp( ( temp_output_79_0_g385 - 2.0 ) , 0.0 , 1.0 );
				float lerpResult69_g385 = lerp( lerpResult66_g385 , tex2DNode37_g380.b , clampResult70_g385);
				float temp_output_40_0_g380 = lerpResult69_g385;
				float temp_output_65_0_g380 = noisemask_mode681;
				float lerpResult58_g380 = lerp( ( temp_output_29_0_g380 * temp_output_40_0_g380 ) , ( temp_output_29_0_g380 + temp_output_40_0_g380 ) , temp_output_65_0_g380);
				float4 tex2DNode6_g380 = tex2D( _noise, temp_output_24_0_g380 );
				float temp_output_79_0_g381 = temp_output_32_0_g380;
				float lerpResult64_g381 = lerp( tex2DNode6_g380.a , tex2DNode6_g380.r , temp_output_79_0_g381);
				float clampResult68_g381 = clamp( ( temp_output_79_0_g381 - 1.0 ) , 0.0 , 1.0 );
				float lerpResult66_g381 = lerp( lerpResult64_g381 , tex2DNode6_g380.g , clampResult68_g381);
				float clampResult70_g381 = clamp( ( temp_output_79_0_g381 - 2.0 ) , 0.0 , 1.0 );
				float lerpResult69_g381 = lerp( lerpResult66_g381 , tex2DNode6_g380.b , clampResult70_g381);
				float temp_output_28_0_g380 = lerpResult69_g381;
				float4 tex2DNode36_g380 = tex2D( _noisemask, temp_output_49_0_g380 );
				float temp_output_79_0_g384 = temp_output_48_0_g380;
				float lerpResult64_g384 = lerp( tex2DNode36_g380.a , tex2DNode36_g380.r , temp_output_79_0_g384);
				float clampResult68_g384 = clamp( ( temp_output_79_0_g384 - 1.0 ) , 0.0 , 1.0 );
				float lerpResult66_g384 = lerp( lerpResult64_g384 , tex2DNode36_g380.g , clampResult68_g384);
				float clampResult70_g384 = clamp( ( temp_output_79_0_g384 - 2.0 ) , 0.0 , 1.0 );
				float lerpResult69_g384 = lerp( lerpResult66_g384 , tex2DNode36_g380.b , clampResult70_g384);
				float temp_output_39_0_g380 = lerpResult69_g384;
				float lerpResult62_g380 = lerp( ( temp_output_28_0_g380 * temp_output_39_0_g380 ) , ( temp_output_28_0_g380 + temp_output_39_0_g380 ) , temp_output_65_0_g380);
				float4 texCoord1_g315 = i.ase_texcoord2;
				texCoord1_g315.xy = i.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_5_0_g315 = custom_noise691;
				float lerpResult2_g315 = lerp( texCoord1_g315.x , texCoord1_g315.y , temp_output_5_0_g315);
				float lerpResult6_g315 = lerp( lerpResult2_g315 , texCoord1_g315.z , saturate( ( temp_output_5_0_g315 - 1.0 ) ));
				float lerpResult11_g315 = lerp( lerpResult6_g315 , texCoord1_g315.w , saturate( ( temp_output_5_0_g315 - 2.0 ) ));
				float4 texCoord15_g315 = i.ase_texcoord4;
				texCoord15_g315.xy = i.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult13_g315 = lerp( lerpResult11_g315 , texCoord15_g315.x , saturate( ( temp_output_5_0_g315 - 3.0 ) ));
				float lerpResult17_g315 = lerp( lerpResult13_g315 , texCoord15_g315.y , saturate( ( temp_output_5_0_g315 - 4.0 ) ));
				float lerpResult20_g315 = lerp( lerpResult17_g315 , texCoord15_g315.z , saturate( ( temp_output_5_0_g315 - 5.0 ) ));
				float lerpResult23_g315 = lerp( lerpResult20_g315 , texCoord15_g315.w , saturate( ( temp_output_5_0_g315 - 6.0 ) ));
				float lerpResult549 = lerp( _noise_intensity_mask , ( _noise_intensity_mask * lerpResult23_g315 ) , toogle_custom_noise696);
				float temp_output_12_0_g380 = ( lerpResult549 * 0.1 );
				float3 appendResult14_g380 = (float3(1.0 , 0.0 , ( ( lerpResult58_g380 - lerpResult62_g380 ) * temp_output_12_0_g380 * 0.1 )));
				float2 appendResult7_g380 = (float2(break20_g380.x , ( break20_g380.y + temp_output_3_0_g380 )));
				float4 tex2DNode4_g380 = tex2D( _noise, appendResult7_g380 );
				float temp_output_79_0_g383 = temp_output_32_0_g380;
				float lerpResult64_g383 = lerp( tex2DNode4_g380.a , tex2DNode4_g380.r , temp_output_79_0_g383);
				float clampResult68_g383 = clamp( ( temp_output_79_0_g383 - 1.0 ) , 0.0 , 1.0 );
				float lerpResult66_g383 = lerp( lerpResult64_g383 , tex2DNode4_g380.g , clampResult68_g383);
				float clampResult70_g383 = clamp( ( temp_output_79_0_g383 - 2.0 ) , 0.0 , 1.0 );
				float lerpResult69_g383 = lerp( lerpResult66_g383 , tex2DNode4_g380.b , clampResult70_g383);
				float temp_output_30_0_g380 = lerpResult69_g383;
				float2 appendResult46_g380 = (float2(break43_g380.x , ( break43_g380.y + temp_output_42_0_g380 )));
				float4 tex2DNode38_g380 = tex2D( _noisemask, appendResult46_g380 );
				float temp_output_79_0_g386 = temp_output_48_0_g380;
				float lerpResult64_g386 = lerp( tex2DNode38_g380.a , tex2DNode38_g380.r , temp_output_79_0_g386);
				float clampResult68_g386 = clamp( ( temp_output_79_0_g386 - 1.0 ) , 0.0 , 1.0 );
				float lerpResult66_g386 = lerp( lerpResult64_g386 , tex2DNode38_g380.g , clampResult68_g386);
				float clampResult70_g386 = clamp( ( temp_output_79_0_g386 - 2.0 ) , 0.0 , 1.0 );
				float lerpResult69_g386 = lerp( lerpResult66_g386 , tex2DNode38_g380.b , clampResult70_g386);
				float temp_output_41_0_g380 = lerpResult69_g386;
				float lerpResult63_g380 = lerp( ( temp_output_30_0_g380 * temp_output_41_0_g380 ) , ( temp_output_30_0_g380 + temp_output_41_0_g380 ) , temp_output_65_0_g380);
				float3 appendResult19_g380 = (float3(0.0 , 1.0 , ( ( lerpResult63_g380 - lerpResult62_g380 ) * temp_output_12_0_g380 * 0.1 )));
				float3 normalizeResult22_g380 = normalize( cross( appendResult14_g380 , appendResult19_g380 ) );
				float3 noise_mask394 = normalizeResult22_g380;
				float4 tex2DNode192 = tex2D( _mask, ( float3( lerpResult67_g388 ,  0.0 ) + noise_mask394 ).xy );
				float temp_output_79_0_g392 = _alpha_mask;
				float lerpResult64_g392 = lerp( tex2DNode192.a , tex2DNode192.r , temp_output_79_0_g392);
				float clampResult68_g392 = clamp( ( temp_output_79_0_g392 - 1.0 ) , 0.0 , 1.0 );
				float lerpResult66_g392 = lerp( lerpResult64_g392 , tex2DNode192.g , clampResult68_g392);
				float clampResult70_g392 = clamp( ( temp_output_79_0_g392 - 2.0 ) , 0.0 , 1.0 );
				float lerpResult69_g392 = lerp( lerpResult66_g392 , tex2DNode192.b , clampResult70_g392);
				float4 texCoord1_g390 = i.ase_texcoord2;
				texCoord1_g390.xy = i.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_5_0_g390 = _customdissoft;
				float lerpResult2_g390 = lerp( texCoord1_g390.x , texCoord1_g390.y , temp_output_5_0_g390);
				float lerpResult6_g390 = lerp( lerpResult2_g390 , texCoord1_g390.z , saturate( ( temp_output_5_0_g390 - 1.0 ) ));
				float lerpResult11_g390 = lerp( lerpResult6_g390 , texCoord1_g390.w , saturate( ( temp_output_5_0_g390 - 2.0 ) ));
				float4 texCoord15_g390 = i.ase_texcoord4;
				texCoord15_g390.xy = i.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult13_g390 = lerp( lerpResult11_g390 , texCoord15_g390.x , saturate( ( temp_output_5_0_g390 - 3.0 ) ));
				float lerpResult17_g390 = lerp( lerpResult13_g390 , texCoord15_g390.y , saturate( ( temp_output_5_0_g390 - 4.0 ) ));
				float lerpResult20_g390 = lerp( lerpResult17_g390 , texCoord15_g390.z , saturate( ( temp_output_5_0_g390 - 5.0 ) ));
				float lerpResult23_g390 = lerp( lerpResult20_g390 , texCoord15_g390.w , saturate( ( temp_output_5_0_g390 - 6.0 ) ));
				float lerpResult309 = lerp( _Float9 , lerpResult23_g390 , _customtoogle_dissoft);
				float temp_output_276_0 = ( 1.0 - lerpResult309 );
				float2 appendResult218 = (float2(_speed_skew_dis.x , _speed_skew_dis.y));
				float2 lerpResult209 = lerp( i.ase_texcoord1.xyz.xy , i.ase_texcoord2.xy , _uv_dis);
				float2 appendResult210 = (float2(ase_grabScreenPosNorm.r , ase_grabScreenPosNorm.g));
				float2 lerpResult215 = lerp( lerpResult209 , appendResult210 , saturate( ( _uv_dis - 1.0 ) ));
				float2 lerpResult982 = lerp( lerpResult215 , flowmapuv969 , flowmap_intensity971);
				float2 lerpResult992 = lerp( lerpResult215 , lerpResult982 , _flowmaptoggle_dis);
				float2 temp_output_51_0_g365 = lerpResult992;
				float2 temp_output_34_0_g366 = ( temp_output_51_0_g365 - float2( 0.5,0.5 ) );
				float2 break39_g366 = temp_output_34_0_g366;
				float2 appendResult50_g366 = (float2(( 1.0 * ( length( temp_output_34_0_g366 ) * 2.0 ) ) , ( ( atan2( break39_g366.x , break39_g366.y ) * ( 1.0 / 6.28318548202515 ) ) * 1.0 )));
				float2 lerpResult14_g365 = lerp( temp_output_51_0_g365 , appendResult50_g366 , _polar_dis);
				float3 appendResult11_g365 = (float3(1.0 , _speed_skew_dis.z , 0.0));
				float3 appendResult9_g365 = (float3(_speed_skew_dis.w , 1.0 , 0.0));
				float2 temp_cast_61 = (0.5).xx;
				float cos18_g365 = cos( ( _rotate_dis * UNITY_PI ) );
				float sin18_g365 = sin( ( _rotate_dis * UNITY_PI ) );
				float2 rotator18_g365 = mul( mul( float3( lerpResult14_g365 ,  0.0 ), float3x3(appendResult11_g365, appendResult9_g365, float3(0,0,1)) ).xy - temp_cast_61 , float2x2( cos18_g365 , -sin18_g365 , sin18_g365 , cos18_g365 )) + temp_cast_61;
				float2 panner20_g365 = ( 1.0 * _Time.y * appendResult218 + rotator18_g365);
				float2 temp_cast_62 = (0.5).xx;
				float2 appendResult216 = (float2(_dis_ST.x , _dis_ST.y));
				float2 appendResult211 = (float2(_dis_ST.z , _dis_ST.w));
				float4 texCoord1_g305 = i.ase_texcoord2;
				texCoord1_g305.xy = i.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_5_0_g305 = _customdisx;
				float lerpResult2_g305 = lerp( texCoord1_g305.x , texCoord1_g305.y , temp_output_5_0_g305);
				float lerpResult6_g305 = lerp( lerpResult2_g305 , texCoord1_g305.z , saturate( ( temp_output_5_0_g305 - 1.0 ) ));
				float lerpResult11_g305 = lerp( lerpResult6_g305 , texCoord1_g305.w , saturate( ( temp_output_5_0_g305 - 2.0 ) ));
				float4 texCoord15_g305 = i.ase_texcoord4;
				texCoord15_g305.xy = i.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult13_g305 = lerp( lerpResult11_g305 , texCoord15_g305.x , saturate( ( temp_output_5_0_g305 - 3.0 ) ));
				float lerpResult17_g305 = lerp( lerpResult13_g305 , texCoord15_g305.y , saturate( ( temp_output_5_0_g305 - 4.0 ) ));
				float lerpResult20_g305 = lerp( lerpResult17_g305 , texCoord15_g305.z , saturate( ( temp_output_5_0_g305 - 5.0 ) ));
				float lerpResult23_g305 = lerp( lerpResult20_g305 , texCoord15_g305.w , saturate( ( temp_output_5_0_g305 - 6.0 ) ));
				float4 texCoord1_g304 = i.ase_texcoord2;
				texCoord1_g304.xy = i.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_5_0_g304 = _customdisy;
				float lerpResult2_g304 = lerp( texCoord1_g304.x , texCoord1_g304.y , temp_output_5_0_g304);
				float lerpResult6_g304 = lerp( lerpResult2_g304 , texCoord1_g304.z , saturate( ( temp_output_5_0_g304 - 1.0 ) ));
				float lerpResult11_g304 = lerp( lerpResult6_g304 , texCoord1_g304.w , saturate( ( temp_output_5_0_g304 - 2.0 ) ));
				float4 texCoord15_g304 = i.ase_texcoord4;
				texCoord15_g304.xy = i.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult13_g304 = lerp( lerpResult11_g304 , texCoord15_g304.x , saturate( ( temp_output_5_0_g304 - 3.0 ) ));
				float lerpResult17_g304 = lerp( lerpResult13_g304 , texCoord15_g304.y , saturate( ( temp_output_5_0_g304 - 4.0 ) ));
				float lerpResult20_g304 = lerp( lerpResult17_g304 , texCoord15_g304.z , saturate( ( temp_output_5_0_g304 - 5.0 ) ));
				float lerpResult23_g304 = lerp( lerpResult20_g304 , texCoord15_g304.w , saturate( ( temp_output_5_0_g304 - 6.0 ) ));
				float2 appendResult212 = (float2(lerpResult23_g305 , lerpResult23_g304));
				float2 lerpResult217 = lerp( appendResult211 , appendResult212 , _customtoogle_disoffset);
				float2 break54_g365 = (( ( ( panner20_g365 - temp_cast_62 ) * _scale_dis ) + 0.5 )*appendResult216 + lerpResult217);
				float clampResult55_g365 = clamp( break54_g365.x , 0.0 , 1.0 );
				float lerpResult58_g365 = lerp( break54_g365.x , clampResult55_g365 , _clampx_dis);
				float clampResult56_g365 = clamp( break54_g365.y , 0.0 , 1.0 );
				float lerpResult59_g365 = lerp( break54_g365.y , clampResult56_g365 , _clampy_dis);
				float2 appendResult57_g365 = (float2(lerpResult58_g365 , lerpResult59_g365));
				float div68_g365=256.0/float((int)( 1.0 + _posterize_dis ));
				float4 posterize68_g365 = ( floor( float4( (appendResult57_g365).xy, 0.0 , 0.0 ) * div68_g365 ) / div68_g365 );
				float2 lerpResult67_g365 = lerp( appendResult57_g365 , (posterize68_g365).rg , _posterizetoogle_dis);
				float2 temp_output_24_0_g306 = noiseuv659;
				float2 break20_g306 = temp_output_24_0_g306;
				float temp_output_11_0_g306 = noise_offset686;
				float temp_output_3_0_g306 = ( pow( temp_output_11_0_g306 , 3.0 ) * 0.1 );
				float2 appendResult23_g306 = (float2(( break20_g306.x + temp_output_3_0_g306 ) , break20_g306.y));
				float4 tex2DNode5_g306 = tex2D( _noise, appendResult23_g306 );
				float temp_output_32_0_g306 = noisetex_alpha652;
				float temp_output_79_0_g308 = temp_output_32_0_g306;
				float lerpResult64_g308 = lerp( tex2DNode5_g306.a , tex2DNode5_g306.r , temp_output_79_0_g308);
				float clampResult68_g308 = clamp( ( temp_output_79_0_g308 - 1.0 ) , 0.0 , 1.0 );
				float lerpResult66_g308 = lerp( lerpResult64_g308 , tex2DNode5_g306.g , clampResult68_g308);
				float clampResult70_g308 = clamp( ( temp_output_79_0_g308 - 2.0 ) , 0.0 , 1.0 );
				float lerpResult69_g308 = lerp( lerpResult66_g308 , tex2DNode5_g306.b , clampResult70_g308);
				float temp_output_29_0_g306 = lerpResult69_g308;
				float2 temp_output_49_0_g306 = noisemaskuv665;
				float2 break43_g306 = temp_output_49_0_g306;
				float temp_output_42_0_g306 = ( pow( temp_output_11_0_g306 , 3.0 ) * 0.1 );
				float2 appendResult45_g306 = (float2(( break43_g306.x + temp_output_42_0_g306 ) , break43_g306.y));
				float4 tex2DNode37_g306 = tex2D( _noisemask, appendResult45_g306 );
				float temp_output_48_0_g306 = noisemask_alpha670;
				float temp_output_79_0_g311 = temp_output_48_0_g306;
				float lerpResult64_g311 = lerp( tex2DNode37_g306.a , tex2DNode37_g306.r , temp_output_79_0_g311);
				float clampResult68_g311 = clamp( ( temp_output_79_0_g311 - 1.0 ) , 0.0 , 1.0 );
				float lerpResult66_g311 = lerp( lerpResult64_g311 , tex2DNode37_g306.g , clampResult68_g311);
				float clampResult70_g311 = clamp( ( temp_output_79_0_g311 - 2.0 ) , 0.0 , 1.0 );
				float lerpResult69_g311 = lerp( lerpResult66_g311 , tex2DNode37_g306.b , clampResult70_g311);
				float temp_output_40_0_g306 = lerpResult69_g311;
				float temp_output_65_0_g306 = noisemask_mode681;
				float lerpResult58_g306 = lerp( ( temp_output_29_0_g306 * temp_output_40_0_g306 ) , ( temp_output_29_0_g306 + temp_output_40_0_g306 ) , temp_output_65_0_g306);
				float4 tex2DNode6_g306 = tex2D( _noise, temp_output_24_0_g306 );
				float temp_output_79_0_g307 = temp_output_32_0_g306;
				float lerpResult64_g307 = lerp( tex2DNode6_g306.a , tex2DNode6_g306.r , temp_output_79_0_g307);
				float clampResult68_g307 = clamp( ( temp_output_79_0_g307 - 1.0 ) , 0.0 , 1.0 );
				float lerpResult66_g307 = lerp( lerpResult64_g307 , tex2DNode6_g306.g , clampResult68_g307);
				float clampResult70_g307 = clamp( ( temp_output_79_0_g307 - 2.0 ) , 0.0 , 1.0 );
				float lerpResult69_g307 = lerp( lerpResult66_g307 , tex2DNode6_g306.b , clampResult70_g307);
				float temp_output_28_0_g306 = lerpResult69_g307;
				float4 tex2DNode36_g306 = tex2D( _noisemask, temp_output_49_0_g306 );
				float temp_output_79_0_g310 = temp_output_48_0_g306;
				float lerpResult64_g310 = lerp( tex2DNode36_g306.a , tex2DNode36_g306.r , temp_output_79_0_g310);
				float clampResult68_g310 = clamp( ( temp_output_79_0_g310 - 1.0 ) , 0.0 , 1.0 );
				float lerpResult66_g310 = lerp( lerpResult64_g310 , tex2DNode36_g306.g , clampResult68_g310);
				float clampResult70_g310 = clamp( ( temp_output_79_0_g310 - 2.0 ) , 0.0 , 1.0 );
				float lerpResult69_g310 = lerp( lerpResult66_g310 , tex2DNode36_g306.b , clampResult70_g310);
				float temp_output_39_0_g306 = lerpResult69_g310;
				float lerpResult62_g306 = lerp( ( temp_output_28_0_g306 * temp_output_39_0_g306 ) , ( temp_output_28_0_g306 + temp_output_39_0_g306 ) , temp_output_65_0_g306);
				float4 texCoord1_g287 = i.ase_texcoord2;
				texCoord1_g287.xy = i.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_5_0_g287 = custom_noise691;
				float lerpResult2_g287 = lerp( texCoord1_g287.x , texCoord1_g287.y , temp_output_5_0_g287);
				float lerpResult6_g287 = lerp( lerpResult2_g287 , texCoord1_g287.z , saturate( ( temp_output_5_0_g287 - 1.0 ) ));
				float lerpResult11_g287 = lerp( lerpResult6_g287 , texCoord1_g287.w , saturate( ( temp_output_5_0_g287 - 2.0 ) ));
				float4 texCoord15_g287 = i.ase_texcoord4;
				texCoord15_g287.xy = i.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult13_g287 = lerp( lerpResult11_g287 , texCoord15_g287.x , saturate( ( temp_output_5_0_g287 - 3.0 ) ));
				float lerpResult17_g287 = lerp( lerpResult13_g287 , texCoord15_g287.y , saturate( ( temp_output_5_0_g287 - 4.0 ) ));
				float lerpResult20_g287 = lerp( lerpResult17_g287 , texCoord15_g287.z , saturate( ( temp_output_5_0_g287 - 5.0 ) ));
				float lerpResult23_g287 = lerp( lerpResult20_g287 , texCoord15_g287.w , saturate( ( temp_output_5_0_g287 - 6.0 ) ));
				float lerpResult554 = lerp( _noise_intensity_dis , ( _noise_intensity_dis * lerpResult23_g287 ) , toogle_custom_noise696);
				float temp_output_12_0_g306 = ( lerpResult554 * 0.1 );
				float3 appendResult14_g306 = (float3(1.0 , 0.0 , ( ( lerpResult58_g306 - lerpResult62_g306 ) * temp_output_12_0_g306 * 0.1 )));
				float2 appendResult7_g306 = (float2(break20_g306.x , ( break20_g306.y + temp_output_3_0_g306 )));
				float4 tex2DNode4_g306 = tex2D( _noise, appendResult7_g306 );
				float temp_output_79_0_g309 = temp_output_32_0_g306;
				float lerpResult64_g309 = lerp( tex2DNode4_g306.a , tex2DNode4_g306.r , temp_output_79_0_g309);
				float clampResult68_g309 = clamp( ( temp_output_79_0_g309 - 1.0 ) , 0.0 , 1.0 );
				float lerpResult66_g309 = lerp( lerpResult64_g309 , tex2DNode4_g306.g , clampResult68_g309);
				float clampResult70_g309 = clamp( ( temp_output_79_0_g309 - 2.0 ) , 0.0 , 1.0 );
				float lerpResult69_g309 = lerp( lerpResult66_g309 , tex2DNode4_g306.b , clampResult70_g309);
				float temp_output_30_0_g306 = lerpResult69_g309;
				float2 appendResult46_g306 = (float2(break43_g306.x , ( break43_g306.y + temp_output_42_0_g306 )));
				float4 tex2DNode38_g306 = tex2D( _noisemask, appendResult46_g306 );
				float temp_output_79_0_g312 = temp_output_48_0_g306;
				float lerpResult64_g312 = lerp( tex2DNode38_g306.a , tex2DNode38_g306.r , temp_output_79_0_g312);
				float clampResult68_g312 = clamp( ( temp_output_79_0_g312 - 1.0 ) , 0.0 , 1.0 );
				float lerpResult66_g312 = lerp( lerpResult64_g312 , tex2DNode38_g306.g , clampResult68_g312);
				float clampResult70_g312 = clamp( ( temp_output_79_0_g312 - 2.0 ) , 0.0 , 1.0 );
				float lerpResult69_g312 = lerp( lerpResult66_g312 , tex2DNode38_g306.b , clampResult70_g312);
				float temp_output_41_0_g306 = lerpResult69_g312;
				float lerpResult63_g306 = lerp( ( temp_output_30_0_g306 * temp_output_41_0_g306 ) , ( temp_output_30_0_g306 + temp_output_41_0_g306 ) , temp_output_65_0_g306);
				float3 appendResult19_g306 = (float3(0.0 , 1.0 , ( ( lerpResult63_g306 - lerpResult62_g306 ) * temp_output_12_0_g306 * 0.1 )));
				float3 normalizeResult22_g306 = normalize( cross( appendResult14_g306 , appendResult19_g306 ) );
				float3 noise_dis396 = normalizeResult22_g306;
				float4 tex2DNode227 = tex2D( _dis, ( float3( lerpResult67_g365 ,  0.0 ) + noise_dis396 ).xy );
				float temp_output_79_0_g379 = _alpha_dis;
				float lerpResult64_g379 = lerp( tex2DNode227.a , tex2DNode227.r , temp_output_79_0_g379);
				float clampResult68_g379 = clamp( ( temp_output_79_0_g379 - 1.0 ) , 0.0 , 1.0 );
				float lerpResult66_g379 = lerp( lerpResult64_g379 , tex2DNode227.g , clampResult68_g379);
				float clampResult70_g379 = clamp( ( temp_output_79_0_g379 - 2.0 ) , 0.0 , 1.0 );
				float lerpResult69_g379 = lerp( lerpResult66_g379 , tex2DNode227.b , clampResult70_g379);
				float2 lerpResult994 = lerp( lerpResult215 , lerpResult982 , _flowmaptoggle_disdir);
				float2 temp_output_51_0_g370 = lerpResult994;
				float2 temp_output_34_0_g371 = ( temp_output_51_0_g370 - float2( 0.5,0.5 ) );
				float2 break39_g371 = temp_output_34_0_g371;
				float2 appendResult50_g371 = (float2(( 1.0 * ( length( temp_output_34_0_g371 ) * 2.0 ) ) , ( ( atan2( break39_g371.x , break39_g371.y ) * ( 1.0 / 6.28318548202515 ) ) * 1.0 )));
				float2 lerpResult14_g370 = lerp( temp_output_51_0_g370 , appendResult50_g371 , _polar_disdir);
				float3 appendResult11_g370 = (float3(1.0 , 0.0 , 0.0));
				float3 appendResult9_g370 = (float3(0.0 , 1.0 , 0.0));
				float2 temp_cast_69 = (0.5).xx;
				float cos18_g370 = cos( ( _rotate_disdir * UNITY_PI ) );
				float sin18_g370 = sin( ( _rotate_disdir * UNITY_PI ) );
				float2 rotator18_g370 = mul( mul( float3( lerpResult14_g370 ,  0.0 ), float3x3(appendResult11_g370, appendResult9_g370, float3(0,0,1)) ).xy - temp_cast_69 , float2x2( cos18_g370 , -sin18_g370 , sin18_g370 , cos18_g370 )) + temp_cast_69;
				float2 panner20_g370 = ( 1.0 * _Time.y * float2( 0,0 ) + rotator18_g370);
				float2 temp_cast_70 = (0.5).xx;
				float2 break54_g370 = (( ( ( panner20_g370 - temp_cast_70 ) * 1.0 ) + 0.5 )*float2( 1,1 ) + float2( 0,0 ));
				float clampResult55_g370 = clamp( break54_g370.x , 0.0 , 1.0 );
				float lerpResult58_g370 = lerp( break54_g370.x , clampResult55_g370 , 0.0);
				float clampResult56_g370 = clamp( break54_g370.y , 0.0 , 1.0 );
				float lerpResult59_g370 = lerp( break54_g370.y , clampResult56_g370 , 0.0);
				float2 appendResult57_g370 = (float2(lerpResult58_g370 , lerpResult59_g370));
				float div68_g370=256.0/float((int)( 1.0 + 0.0 ));
				float4 posterize68_g370 = ( floor( float4( (appendResult57_g370).xy, 0.0 , 0.0 ) * div68_g370 ) / div68_g370 );
				float2 lerpResult67_g370 = lerp( appendResult57_g370 , (posterize68_g370).rg , 0.0);
				float lerpResult263 = lerp( lerpResult69_g379 , tex2D( _disdir, lerpResult67_g370 ).r , _disdir_blend);
				float temp_output_265_0 = ( lerpResult263 + 1.0 );
				float4 texCoord1_g376 = i.ase_texcoord2;
				texCoord1_g376.xy = i.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_5_0_g376 = _customdis;
				float lerpResult2_g376 = lerp( texCoord1_g376.x , texCoord1_g376.y , temp_output_5_0_g376);
				float lerpResult6_g376 = lerp( lerpResult2_g376 , texCoord1_g376.z , saturate( ( temp_output_5_0_g376 - 1.0 ) ));
				float lerpResult11_g376 = lerp( lerpResult6_g376 , texCoord1_g376.w , saturate( ( temp_output_5_0_g376 - 2.0 ) ));
				float4 texCoord15_g376 = i.ase_texcoord4;
				texCoord15_g376.xy = i.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult13_g376 = lerp( lerpResult11_g376 , texCoord15_g376.x , saturate( ( temp_output_5_0_g376 - 3.0 ) ));
				float lerpResult17_g376 = lerp( lerpResult13_g376 , texCoord15_g376.y , saturate( ( temp_output_5_0_g376 - 4.0 ) ));
				float lerpResult20_g376 = lerp( lerpResult17_g376 , texCoord15_g376.z , saturate( ( temp_output_5_0_g376 - 5.0 ) ));
				float lerpResult23_g376 = lerp( lerpResult20_g376 , texCoord15_g376.w , saturate( ( temp_output_5_0_g376 - 6.0 ) ));
				float lerpResult313 = lerp( _dis_s , lerpResult23_g376 , _customtoogle_dis);
				float lerpResult1207 = lerp( lerpResult313 , ( 1.0 - i.ase_color.a ) , _alphatoogle_dis);
				float smoothstepResult273 = smoothstep( lerpResult309 , temp_output_276_0 , saturate( ( temp_output_265_0 - ( 2.0 * lerpResult1207 ) ) ));
				float Depthfade897 = temp_output_887_0;
				float lerpResult912 = lerp( Depthfade897 , 1.0 , depthfade_invert_toggle898);
				float lerpResult1222 = lerp( 1.0 , i.ase_color.a , _vertexcolor_toggle);
				float temp_output_196_0 = ( lerpResult829 * lerpResult69_g392 * smoothstepResult273 * lerpResult912 * _Alpha * lerpResult1222 );
				float2 appendResult1065 = (float2(temp_output_196_0 , 0.0));
				float2 ramp_mian1064 = appendResult1065;
				float2 panner1213 = ( 1.0 * _Time.y * appendResult1215 + ramp_mian1064);
				float4 tex2DNode1066 = tex2D( _ramptex, panner1213 );
				float3 ramp_rgb1069 = tex2DNode1066.rgb;
				float3 lerpResult1071 = lerp( lerpResult84_g393 , ramp_rgb1069 , _ramptoggle_rgb);
				float4 temp_cast_74 = (1.0).xxxx;
				float4 lerpResult1220 = lerp( temp_cast_74 , i.ase_color , _vertexcolor_toggle);
				float4 temp_output_815_0 = ( float4( _color_main.rgb , 0.0 ) * float4( ( npr962 * lerpResult1071 ) , 0.0 ) * lerpResult1220 );
				float4 lerpResult847 = lerp( temp_output_815_0 , float4( _ColorFresnel.rgb , 0.0 ) , fresnel794);
				float4 lerpResult851 = lerp( temp_output_815_0 , lerpResult847 , _fresnelmode);
				float4 lerpResult850 = lerp( temp_output_815_0 , lerpResult851 , _toggle_fresnel);
				float clip1202 = _dis_clip;
				float smoothstepResult328 = smoothstep( lerpResult309 , temp_output_276_0 , saturate( ( temp_output_265_0 - ( 2.0 * ( lerpResult1207 + ( _edge * 0.1 ) + clip1202 ) ) ) ));
				float dis_edge330 = ( smoothstepResult273 - smoothstepResult328 );
				float4 lerpResult333 = lerp( ( float4( Depthfade_invert902 , 0.0 ) + lerpResult850 ) , float4( _edgecolor.rgb , 0.0 ) , dis_edge330);
				float2 temp_output_24_0_g401 = noiseuv659;
				float2 break20_g401 = temp_output_24_0_g401;
				float temp_output_11_0_g401 = noise_offset686;
				float temp_output_3_0_g401 = ( pow( temp_output_11_0_g401 , 3.0 ) * 0.1 );
				float2 appendResult23_g401 = (float2(( break20_g401.x + temp_output_3_0_g401 ) , break20_g401.y));
				float4 tex2DNode5_g401 = tex2D( _noise, appendResult23_g401 );
				float temp_output_32_0_g401 = noisetex_alpha652;
				float temp_output_79_0_g403 = temp_output_32_0_g401;
				float lerpResult64_g403 = lerp( tex2DNode5_g401.a , tex2DNode5_g401.r , temp_output_79_0_g403);
				float clampResult68_g403 = clamp( ( temp_output_79_0_g403 - 1.0 ) , 0.0 , 1.0 );
				float lerpResult66_g403 = lerp( lerpResult64_g403 , tex2DNode5_g401.g , clampResult68_g403);
				float clampResult70_g403 = clamp( ( temp_output_79_0_g403 - 2.0 ) , 0.0 , 1.0 );
				float lerpResult69_g403 = lerp( lerpResult66_g403 , tex2DNode5_g401.b , clampResult70_g403);
				float temp_output_29_0_g401 = lerpResult69_g403;
				float2 temp_output_49_0_g401 = noisemaskuv665;
				float2 break43_g401 = temp_output_49_0_g401;
				float temp_output_42_0_g401 = ( pow( temp_output_11_0_g401 , 3.0 ) * 0.1 );
				float2 appendResult45_g401 = (float2(( break43_g401.x + temp_output_42_0_g401 ) , break43_g401.y));
				float4 tex2DNode37_g401 = tex2D( _noisemask, appendResult45_g401 );
				float temp_output_48_0_g401 = noisemask_alpha670;
				float temp_output_79_0_g406 = temp_output_48_0_g401;
				float lerpResult64_g406 = lerp( tex2DNode37_g401.a , tex2DNode37_g401.r , temp_output_79_0_g406);
				float clampResult68_g406 = clamp( ( temp_output_79_0_g406 - 1.0 ) , 0.0 , 1.0 );
				float lerpResult66_g406 = lerp( lerpResult64_g406 , tex2DNode37_g401.g , clampResult68_g406);
				float clampResult70_g406 = clamp( ( temp_output_79_0_g406 - 2.0 ) , 0.0 , 1.0 );
				float lerpResult69_g406 = lerp( lerpResult66_g406 , tex2DNode37_g401.b , clampResult70_g406);
				float temp_output_40_0_g401 = lerpResult69_g406;
				float temp_output_65_0_g401 = noisemask_mode681;
				float lerpResult58_g401 = lerp( ( temp_output_29_0_g401 * temp_output_40_0_g401 ) , ( temp_output_29_0_g401 + temp_output_40_0_g401 ) , temp_output_65_0_g401);
				float4 tex2DNode6_g401 = tex2D( _noise, temp_output_24_0_g401 );
				float temp_output_79_0_g402 = temp_output_32_0_g401;
				float lerpResult64_g402 = lerp( tex2DNode6_g401.a , tex2DNode6_g401.r , temp_output_79_0_g402);
				float clampResult68_g402 = clamp( ( temp_output_79_0_g402 - 1.0 ) , 0.0 , 1.0 );
				float lerpResult66_g402 = lerp( lerpResult64_g402 , tex2DNode6_g401.g , clampResult68_g402);
				float clampResult70_g402 = clamp( ( temp_output_79_0_g402 - 2.0 ) , 0.0 , 1.0 );
				float lerpResult69_g402 = lerp( lerpResult66_g402 , tex2DNode6_g401.b , clampResult70_g402);
				float temp_output_28_0_g401 = lerpResult69_g402;
				float4 tex2DNode36_g401 = tex2D( _noisemask, temp_output_49_0_g401 );
				float temp_output_79_0_g405 = temp_output_48_0_g401;
				float lerpResult64_g405 = lerp( tex2DNode36_g401.a , tex2DNode36_g401.r , temp_output_79_0_g405);
				float clampResult68_g405 = clamp( ( temp_output_79_0_g405 - 1.0 ) , 0.0 , 1.0 );
				float lerpResult66_g405 = lerp( lerpResult64_g405 , tex2DNode36_g401.g , clampResult68_g405);
				float clampResult70_g405 = clamp( ( temp_output_79_0_g405 - 2.0 ) , 0.0 , 1.0 );
				float lerpResult69_g405 = lerp( lerpResult66_g405 , tex2DNode36_g401.b , clampResult70_g405);
				float temp_output_39_0_g401 = lerpResult69_g405;
				float lerpResult62_g401 = lerp( ( temp_output_28_0_g401 * temp_output_39_0_g401 ) , ( temp_output_28_0_g401 + temp_output_39_0_g401 ) , temp_output_65_0_g401);
				float4 texCoord1_g394 = i.ase_texcoord2;
				texCoord1_g394.xy = i.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_5_0_g394 = custom_noise691;
				float lerpResult2_g394 = lerp( texCoord1_g394.x , texCoord1_g394.y , temp_output_5_0_g394);
				float lerpResult6_g394 = lerp( lerpResult2_g394 , texCoord1_g394.z , saturate( ( temp_output_5_0_g394 - 1.0 ) ));
				float lerpResult11_g394 = lerp( lerpResult6_g394 , texCoord1_g394.w , saturate( ( temp_output_5_0_g394 - 2.0 ) ));
				float4 texCoord15_g394 = i.ase_texcoord4;
				texCoord15_g394.xy = i.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult13_g394 = lerp( lerpResult11_g394 , texCoord15_g394.x , saturate( ( temp_output_5_0_g394 - 3.0 ) ));
				float lerpResult17_g394 = lerp( lerpResult13_g394 , texCoord15_g394.y , saturate( ( temp_output_5_0_g394 - 4.0 ) ));
				float lerpResult20_g394 = lerp( lerpResult17_g394 , texCoord15_g394.z , saturate( ( temp_output_5_0_g394 - 5.0 ) ));
				float lerpResult23_g394 = lerp( lerpResult20_g394 , texCoord15_g394.w , saturate( ( temp_output_5_0_g394 - 6.0 ) ));
				float lerpResult705 = lerp( _noise_intensity_screen , ( _noise_intensity_screen * lerpResult23_g394 ) , toogle_custom_noise696);
				float temp_output_12_0_g401 = lerpResult705;
				float3 appendResult14_g401 = (float3(1.0 , 0.0 , ( ( lerpResult58_g401 - lerpResult62_g401 ) * temp_output_12_0_g401 * 0.1 )));
				float2 appendResult7_g401 = (float2(break20_g401.x , ( break20_g401.y + temp_output_3_0_g401 )));
				float4 tex2DNode4_g401 = tex2D( _noise, appendResult7_g401 );
				float temp_output_79_0_g404 = temp_output_32_0_g401;
				float lerpResult64_g404 = lerp( tex2DNode4_g401.a , tex2DNode4_g401.r , temp_output_79_0_g404);
				float clampResult68_g404 = clamp( ( temp_output_79_0_g404 - 1.0 ) , 0.0 , 1.0 );
				float lerpResult66_g404 = lerp( lerpResult64_g404 , tex2DNode4_g401.g , clampResult68_g404);
				float clampResult70_g404 = clamp( ( temp_output_79_0_g404 - 2.0 ) , 0.0 , 1.0 );
				float lerpResult69_g404 = lerp( lerpResult66_g404 , tex2DNode4_g401.b , clampResult70_g404);
				float temp_output_30_0_g401 = lerpResult69_g404;
				float2 appendResult46_g401 = (float2(break43_g401.x , ( break43_g401.y + temp_output_42_0_g401 )));
				float4 tex2DNode38_g401 = tex2D( _noisemask, appendResult46_g401 );
				float temp_output_79_0_g407 = temp_output_48_0_g401;
				float lerpResult64_g407 = lerp( tex2DNode38_g401.a , tex2DNode38_g401.r , temp_output_79_0_g407);
				float clampResult68_g407 = clamp( ( temp_output_79_0_g407 - 1.0 ) , 0.0 , 1.0 );
				float lerpResult66_g407 = lerp( lerpResult64_g407 , tex2DNode38_g401.g , clampResult68_g407);
				float clampResult70_g407 = clamp( ( temp_output_79_0_g407 - 2.0 ) , 0.0 , 1.0 );
				float lerpResult69_g407 = lerp( lerpResult66_g407 , tex2DNode38_g401.b , clampResult70_g407);
				float temp_output_41_0_g401 = lerpResult69_g407;
				float lerpResult63_g401 = lerp( ( temp_output_30_0_g401 * temp_output_41_0_g401 ) , ( temp_output_30_0_g401 + temp_output_41_0_g401 ) , temp_output_65_0_g401);
				float3 appendResult19_g401 = (float3(0.0 , 1.0 , ( ( lerpResult63_g401 - lerpResult62_g401 ) * temp_output_12_0_g401 * 0.1 )));
				float3 normalizeResult22_g401 = normalize( cross( appendResult14_g401 , appendResult19_g401 ) );
				float3 lerpResult1104 = lerp( normalizeResult22_g401 , normal1169 , _normalnoise_toggle);
				float4 screenColor731 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_GrabTexture,( ase_grabScreenPosNorm + float4( lerpResult1104 , 0.0 ) ).xy);
				float4 ref738 = screenColor731;
				float4 lerpResult739 = lerp( ( matcap765 * lerpResult333 ) , ref738 , _toggle_ref);
				float ramp_a1070 = tex2DNode1066.a;
				float lerpResult1089 = lerp( temp_output_196_0 , ramp_a1070 , _ramptoggle_a);
				float lerpResult1101 = lerp( lerpResult1089 , saturate( lerpResult1089 ) , _AlphaClamp);
				float clipuv1181 = lerpResult263;
				clip( clipuv1181 - _dis_clip);
				float4 appendResult18 = (float4(( _color_scale * lerpResult739 ).rgb , lerpResult1101));
				
				
				finalColor = appendResult18;
				return finalColor;
			}
			ENDCG
		}
	}
	CustomEditor "LWGUI.LWGUI"
	
	Fallback Off
}
/*ASEBEGIN
Version=19800
Node;AmplifyShaderEditor.CommentaryNode;1062;-3984,23008;Inherit;False;1108;882.666;flowmap;13;1059;967;970;1060;1061;968;1058;969;971;1040;1039;1041;1042;flowmap;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;101;-4864,-1072;Inherit;False;4071.604;1914.495;maintex;52;44;45;871;872;72;71;17;73;74;78;397;76;398;77;75;855;91;32;36;40;92;94;30;41;43;87;38;22;97;100;31;37;20;27;24;29;95;99;21;19;26;23;98;96;25;873;972;973;974;984;987;1047;maintex;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;1059;-3920,23440;Inherit;False;Property;_customflowmap;flowmap强度;251;0;Create;False;0;8;custom1x;0;custom1y;1;custom1z;2;custom1w;3;custom2x;4;custom2y;5;custom2z;6;custom2w;7;0;False;2;SubKeywordEnumDrawer(ga6,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w);Advanced(Custom);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;25;-4752,-720;Inherit;False;Property;_uv_maintex;主贴图uv;23;0;Create;False;0;3;uv1;0;uv2;1;uv_screen;2;0;True;2;KWEnum(g2,uv1,_0,uv2,_1,uv_screen,_2);Advanced(UV);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;489;-4354,8750;Inherit;False;2714.8;1570.8;Noise;43;350;351;352;353;354;355;356;357;358;359;360;361;362;363;365;364;366;367;368;369;370;371;372;377;373;374;375;376;381;453;413;417;686;652;536;691;538;696;1008;1006;1010;1007;1009;Noise;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;490;-4400,10752;Inherit;False;2794.8;1538.8;NoiseMask;40;456;454;455;458;460;461;462;459;457;463;464;466;467;468;465;469;470;471;472;473;474;476;475;481;480;479;478;477;482;483;484;670;675;567;681;1011;1012;1013;1014;1015;NoiseMask;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;970;-3824,23312;Inherit;False;Property;_flowmap_intensity;flowmap强度;242;0;Create;False;0;0;0;False;1;Sub(ga6);False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1061;-3696,23552;Inherit;False;Property;_customtoogle_flowmap;custom控制flowmap;250;0;Create;False;0;0;0;False;3;SubToggle(ga6, _);Advanced(Custom);Title(VertexOffset);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;967;-3776,23056;Inherit;True;Property;_flowmap;flowmaptex;241;0;Create;False;0;0;0;False;2;Sub(ga6);Helpbox(Uncheck the sRGB option for the texture);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.FunctionNode;1060;-3696,23440;Inherit;False;custom;-1;;272;779eb99551fb15b4496badaf8a633e05;0;1;5;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;19;-4752,-1024;Inherit;False;0;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexCoordVertexDataNode;21;-4752,-896;Inherit;False;1;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GrabScreenPosition;23;-4816,-608;Inherit;False;0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;26;-4448,-720;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;350;-3696,9088;Inherit;False;Property;_uv_noise;扰动uv;109;0;Create;False;0;3;uv1;0;uv2;1;uv_screen;2;0;True;2;KWEnum(g6,uv1,_0,uv2,_1,uv_screen,_2);Advanced(UV);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;456;-3792,11104;Inherit;False;Property;_uv_noisemask;扰动maskuv;136;0;Create;False;0;3;uv1;0;uv2;1;uv_screen;2;0;True;2;KWEnum(g7,uv1,_0,uv2,_1,uv_screen,_2);Advanced(UV);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1058;-3360,23328;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;968;-3344,23120;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;20;-4336,-928;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;24;-4400,-592;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SaturateNode;27;-4240,-704;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;96;-4784,-192;Inherit;False;Property;_custommainx;x轴offset;38;0;Create;False;0;8;custom1x;0;custom1y;1;custom1z;2;custom1w;3;custom2x;4;custom2y;5;custom2z;6;custom2w;7;0;False;2;SubKeywordEnumDrawer(g2,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w);Advanced(Custom);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;98;-4800,-80;Inherit;False;Property;_custommainy;y轴offset;39;0;Create;False;0;8;custom1x;0;custom1y;1;custom1z;2;custom1w;3;custom2x;4;custom2y;5;custom2z;6;custom2w;7;0;False;2;SubKeywordEnumDrawer(g2,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w);Advanced(Custom);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;353;-3360,9088;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;354;-3696,8912;Inherit;False;1;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GrabScreenPosition;355;-3728,9200;Inherit;False;0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexCoordVertexDataNode;358;-3696,8784;Inherit;False;0;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexCoordVertexDataNode;458;-3792,10928;Inherit;False;1;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexCoordVertexDataNode;462;-3792,10800;Inherit;False;0;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GrabScreenPosition;459;-3824,11216;Inherit;False;0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;457;-3456,11104;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;969;-3104,23136;Inherit;False;flowmapuv;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;971;-3152,23360;Inherit;False;flowmap_intensity;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;22;-4016,-784;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;974;-3824,-688;Inherit;False;971;flowmap_intensity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;352;-4304,9808;Inherit;False;Property;_customnoisey;y轴offset;120;0;Create;False;0;8;custom1x;0;custom1y;1;custom1z;2;custom1w;3;custom2x;4;custom2y;5;custom2z;6;custom2w;7;0;False;2;SubKeywordEnumDrawer(g6,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w);Advanced(Custom);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;351;-4304,9712;Inherit;False;Property;_customnoisex;x轴offset;119;0;Create;False;0;8;custom1x;0;custom1y;1;custom1z;2;custom1w;3;custom2x;4;custom2y;5;custom2z;6;custom2w;7;0;False;2;SubKeywordEnumDrawer(g6,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w);Advanced(Custom);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;99;-4496,-80;Inherit;False;custom;-1;;273;779eb99551fb15b4496badaf8a633e05;0;1;5;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;95;-4480,-176;Inherit;False;custom;-1;;274;779eb99551fb15b4496badaf8a633e05;0;1;5;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;29;-4560,-384;Inherit;False;Property;_maintex_ST;_maintex_ST;21;1;[HideInInspector];Create;True;0;0;0;False;1;Sub(g2);False;1,1,0,0;1,1,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;536;-2096,10064;Inherit;False;Property;_custom_noises;扰动总强度;122;0;Create;False;0;8;custom1x;0;custom1y;1;custom1z;2;custom1w;3;custom2x;4;custom2y;5;custom2z;6;custom2w;7;0;False;2;SubKeywordEnumDrawer(g6,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w);Advanced(Custom);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;360;-3280,8880;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;361;-3344,9216;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SaturateNode;365;-3200,9056;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;464;-3376,10896;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SaturateNode;468;-3296,11104;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;465;-3440,11232;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;972;-3776,-768;Inherit;False;969;flowmapuv;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;455;-4352,11808;Inherit;False;Property;_customnoisemasky;y轴offset;147;0;Create;False;0;8;custom1x;0;custom1y;1;custom1z;2;custom1w;3;custom2x;4;custom2y;5;custom2z;6;custom2w;7;0;False;2;SubKeywordEnumDrawer(g7,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w);Advanced(Custom);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;454;-4352,11712;Inherit;False;Property;_customnoisemaskx;x轴offset;146;0;Create;False;0;8;custom1x;0;custom1y;1;custom1z;2;custom1w;3;custom2x;4;custom2y;5;custom2z;6;custom2w;7;0;False;2;SubKeywordEnumDrawer(g7,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w);Advanced(Custom);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;973;-3456,-768;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;356;-4016,9808;Inherit;False;custom;-1;;275;779eb99551fb15b4496badaf8a633e05;0;1;5;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;357;-4016,9712;Inherit;False;custom;-1;;276;779eb99551fb15b4496badaf8a633e05;0;1;5;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;359;-4080,9504;Inherit;False;Property;_noise_ST;_noise_ST;107;1;[HideInInspector];Create;True;0;0;0;False;1;Sub(g6);False;1,1,0,0;1,1,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;460;-4064,11808;Inherit;False;custom;-1;;277;779eb99551fb15b4496badaf8a633e05;0;1;5;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;463;-4128,11504;Inherit;False;Property;_noisemask_ST;_noisemask_ST;133;1;[HideInInspector];Create;True;0;0;0;False;1;Sub(g7);False;1,1,0,0;1,1,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;461;-4064,11712;Inherit;False;custom;-1;;278;779eb99551fb15b4496badaf8a633e05;0;1;5;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;37;-3552,-80;Inherit;False;Property;_speed_skew_maintex;主贴图流动&斜切;24;0;Create;False;0;0;0;False;2;Sub(g2);Advanced(UV);False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;31;-4160,-288;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;100;-4160,-144;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;97;-4288,16;Inherit;False;Property;_customtoogle_mainoffset;custom控制offset;37;0;Create;False;0;0;0;False;5;SubToggle(g2, _);Advanced(Custom);Helpbox(add uv2);Helpbox(custom1xyzw);Helpbox(custom2xyzw);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;691;-1888,10064;Inherit;False;custom_noise;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;367;-2992,8976;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;1006;-2989.241,9240.328;Inherit;False;971;flowmap_intensity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1010;-2909.241,9160.328;Inherit;False;969;flowmapuv;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;471;-3040,11040;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;1011;-3056,11296;Inherit;False;971;flowmap_intensity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1012;-2976,11216;Inherit;False;969;flowmapuv;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;987;-3216,-656;Inherit;False;Property;_flowmaptoggle_main;主贴图flowmap;243;0;Create;False;0;0;0;False;2;SubToggle(ga6, _);Advanced(toggle);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;362;-3680,9600;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;363;-3680,9744;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector4Node;364;-3072,9808;Inherit;False;Property;_speed_skew_noise;扰动流动&斜切;110;0;Create;False;0;0;0;False;2;Sub(g6);Advanced(UV);False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;466;-3728,11600;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;467;-3728,11744;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector4Node;470;-3120,11808;Inherit;False;Property;_speed_skew_noisemask;扰动mask流动&斜切;137;0;Create;False;0;0;0;False;2;Sub(g7);Advanced(UV);False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;38;-3216,-160;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;87;-3104,288;Inherit;False;Property;_posterize;像素化;31;0;Create;False;0;0;0;False;2;Sub(g2);Advanced(posterize);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;43;-3088,112;Inherit;False;Property;_clampy_maintex;yclamp;29;0;Create;False;0;0;0;False;2;SubToggle(g2, _);Advanced(Clamp);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;41;-3088,32;Inherit;False;Property;_clampx_maintex;xclamp;28;0;Create;False;0;0;0;False;2;SubToggle(g2, _);Advanced(Clamp);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;30;-4096,-416;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;94;-3888,-224;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;92;-3088,192;Inherit;False;Property;_posterizetoogle_maintex;开启像素化;30;0;Create;False;0;0;0;False;2;SubToggle(g2, _);Advanced(posterize);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;32;-3520,-320;Inherit;False;Property;_scale_maintex;主贴图中心缩放;25;0;Create;False;0;0;0;False;2;Sub(g2);Advanced(UV);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;36;-3536,-208;Inherit;False;Property;_rotate_maintex;主贴图旋转;27;0;Create;False;0;0;0;False;2;Sub(g2);Advanced(UV);False;0;1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;538;-2112,10176;Inherit;False;Property;_customtoogle_noisescale;custom控制扰动;121;0;Create;False;0;0;0;False;3;SubToggle(g6, _);Advanced(Custom);Title(Noise);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1007;-2637.241,9096.328;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;1008;-2669.241,9256.328;Inherit;False;Property;_flowmaptoggle_noise;Noiseflowmap;248;0;Create;False;0;0;0;False;2;SubToggle(ga6, _);Advanced(toggle);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1013;-2704,11152;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;1014;-2736,11312;Inherit;False;Property;_flowmaptoggle_noisemask;NoiseMaskflowmap;249;0;Create;False;0;0;0;False;2;SubToggle(ga6, _);Advanced(toggle);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;162;-4274,1358;Inherit;False;3332;1538.8;Subtex;39;112;121;122;114;115;116;113;125;124;123;126;118;119;117;127;128;129;137;133;132;136;131;138;139;120;134;135;130;111;109;141;140;400;399;975;976;977;988;989;Subtex;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;693;-560,10864;Inherit;False;691;custom_noise;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;40;-3104,-48;Inherit;False;Property;_polar_maintex;主贴图极坐标;26;0;Create;False;0;0;0;False;2;SubToggle(g2, _);Advanced(UV);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;984;-2960,-880;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;366;-3808,9936;Inherit;False;Property;_customtoogle_noiseoffset;custom控制offset;118;0;Create;False;0;0;0;False;6;SubToggle(g6, _);Advanced(Custom);Helpbox(add uv2);Helpbox(custom1xyzw);Helpbox(custom2xyzw);Title(Offset);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;469;-3856,11936;Inherit;False;Property;_customtoogle_noisemaskoffset;custom控制offset;145;0;Create;False;0;0;0;False;6;SubToggle(g7, _);Advanced(Custom);Helpbox(add uv2);Helpbox(custom1xyzw);Helpbox(custom2xyzw);Title(Offset);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;692;-768,9792;Inherit;False;691;custom_noise;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;883;-4082,18846;Inherit;False;1268;617.666;parallax;7;858;860;856;859;857;854;862;parallax;1,1,1,1;0;0
Node;AmplifyShaderEditor.DynamicAppendNode;368;-3680,9488;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;369;-3408,9664;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;370;-2576,9664;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;371;-3056,9680;Inherit;False;Property;_rotate_noise;扰动旋转;113;0;Create;False;0;0;0;False;2;Sub(g6);Advanced(UV);False;0;1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;372;-2976,9584;Inherit;False;Property;_scale_noise;扰动中心缩放;111;0;Create;False;0;0;0;False;2;Sub(g6);Advanced(UV);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;373;-2608,9920;Inherit;False;Property;_clampx_noise;xclamp;114;0;Create;False;0;0;0;False;2;SubToggle(g6, _);Advanced(Clamp);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;374;-2608,10000;Inherit;False;Property;_clampy_noise;yclamp;115;0;Create;False;0;0;0;False;2;SubToggle(g6, _);Advanced(Clamp);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;375;-2608,10080;Inherit;False;Property;_posterizetoogle_noise;开启像素化;116;0;Create;False;0;0;0;False;2;SubToggle(g6, _);Advanced(posterize);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;376;-2608,10176;Inherit;False;Property;_posterize_noise;像素化;117;0;Create;False;0;0;0;False;2;Sub(g6);Advanced(posterize);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;472;-3728,11488;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;473;-3456,11664;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;474;-2624,11664;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;475;-3104,11680;Inherit;False;Property;_rotate_noisemask;扰动mask旋转;140;0;Create;False;0;0;0;False;2;Sub(g7);Advanced(UV);False;0;1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;481;-2656,12176;Inherit;False;Property;_posterize_noisemask;像素化;144;0;Create;False;0;0;0;False;2;Sub(g7);Advanced(posterize);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;480;-2656,12080;Inherit;False;Property;_posterizetoogle_noisemask;开启像素化;143;0;Create;False;0;0;0;False;2;SubToggle(g7, _);Advanced(posterize);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;479;-2656,12000;Inherit;False;Property;_clampy_noisemask;yclamp;142;0;Create;False;0;0;0;False;2;SubToggle(g7, _);Advanced(Clamp);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;476;-3024,11584;Inherit;False;Property;_scale_noisemask;扰动mask中心缩放;138;0;Create;False;0;0;0;False;2;Sub(g7);Advanced(UV);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;477;-2672,11840;Inherit;False;Property;_polar_noisemask;扰动mask极坐标;139;0;Create;False;0;0;0;False;2;SubToggle(g7, _);Advanced(UV);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;478;-2656,11920;Inherit;False;Property;_clampx_noisemask;xclamp;141;0;Create;False;0;0;0;False;2;SubToggle(g7, _);Advanced(Clamp);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;377;-2624,9840;Inherit;False;Property;_polar_noise;扰动极坐标;112;0;Create;False;0;0;0;False;2;SubToggle(g6, _);Advanced(UV);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;696;-1872,10176;Inherit;False;toogle_custom_noise;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;385;-416,9664;Inherit;False;Property;_noise_intensity_main;主贴图扰动强度;124;0;Create;False;0;0;0;False;1;Sub(g6);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;537;-448,9792;Inherit;False;custom;-1;;279;779eb99551fb15b4496badaf8a633e05;0;1;5;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1009;-2381.241,9080.328;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;1015;-2448,11136;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;91;-2848,-400;Inherit;False;uv;-1;;280;bd08fc3240751e7458a55d201311c21d;0;13;51;FLOAT2;0,0;False;43;FLOAT2;1,1;False;44;FLOAT2;0,0;False;45;FLOAT;1;False;46;FLOAT;0;False;47;FLOAT2;0,0;False;48;FLOAT;0;False;49;FLOAT;0;False;50;FLOAT;0;False;60;FLOAT;0;False;61;FLOAT;0;False;73;FLOAT;0;False;71;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;389;-416,10768;Inherit;False;Property;_noise_intensity_sub;副贴图扰动强度;125;0;Create;False;0;0;0;False;1;Sub(g6);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;543;-192,10848;Inherit;False;custom;-1;;282;779eb99551fb15b4496badaf8a633e05;0;1;5;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;112;-4048,1712;Inherit;False;Property;_uv_subtex;副贴图uv;44;0;Create;False;0;3;uv1;0;uv2;1;uv_screen;2;0;True;2;KWEnum(g3,uv1,_0,uv2,_1,uv_screen,_2);Advanced(UV);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;852;-4098,18014;Inherit;False;2430.058;731.6797;Fresnel;16;784;775;779;922;921;920;772;794;777;781;782;923;924;925;1078;1079;Fresnel;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;349;-4368,5712;Inherit;False;6146.778;2434.8;dissolove;81;198;199;200;201;203;204;205;206;202;207;209;210;211;212;214;208;213;314;215;216;217;218;219;220;222;223;224;225;221;315;272;316;226;249;257;313;318;228;227;244;319;229;254;264;317;263;311;266;323;271;312;310;275;265;325;269;309;326;267;276;327;274;328;273;329;330;403;404;981;982;983;992;993;994;995;1181;1203;1207;1208;1209;1210;dissolove;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;695;-992,12448;Inherit;False;691;custom_noise;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;381;-2016,9184;Inherit;False;uv;-1;;283;bd08fc3240751e7458a55d201311c21d;0;13;51;FLOAT2;0,0;False;43;FLOAT2;1,1;False;44;FLOAT2;0,0;False;45;FLOAT;1;False;46;FLOAT;0;False;47;FLOAT2;0,0;False;48;FLOAT;0;False;49;FLOAT;0;False;50;FLOAT;0;False;60;FLOAT;0;False;61;FLOAT;0;False;73;FLOAT;0;False;71;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;482;-2064,11184;Inherit;False;uv;-1;;285;bd08fc3240751e7458a55d201311c21d;0;13;51;FLOAT2;0,0;False;43;FLOAT2;1,1;False;44;FLOAT2;0,0;False;45;FLOAT;1;False;46;FLOAT;0;False;47;FLOAT2;0,0;False;48;FLOAT;0;False;49;FLOAT;0;False;50;FLOAT;0;False;60;FLOAT;0;False;61;FLOAT;0;False;73;FLOAT;0;False;71;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TexturePropertyNode;483;-2176,11968;Inherit;True;Property;_noisemask;扰动mask;132;0;Create;False;0;0;0;False;1;Sub(g7);False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode;413;-2064,9968;Inherit;False;Property;_alpha_noise;扰动通道;108;0;Create;False;0;4;A;0;R;1;G;2;B;3;0;True;1;KWEnum(g6,A,_0,R,_1,G,_2,B,_3);False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;417;-2096,9872;Inherit;False;Property;_offset;offset;123;0;Create;True;0;0;0;False;2;Sub(g6);Title(Noise);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;484;-2144,11040;Inherit;False;Property;_alpha_noisemask;扰动mask通道;134;0;Create;False;0;4;A;0;R;1;G;2;B;3;0;True;1;KWEnum(g7,A,_0,R,_1,G,_2,B,_3);False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;567;-2144,10880;Inherit;False;Property;_noisemaskmode;mask模式(相乘/相加);135;0;Create;False;0;4;A;0;R;1;G;2;B;3;0;True;1;KWEnum(g7,Multiple,_0,Add,_1);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;858;-4032,19184;Inherit;False;Property;_parallax_scale;视差缩放;197;0;Create;False;0;0;0;False;1;Sub(ga3);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;697;-176,9856;Inherit;False;696;toogle_custom_noise;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;541;-112,9696;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;855;-2400,-480;Inherit;False;uv_mantex;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;114;-3712,1712;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;115;-4048,1408;Inherit;False;0;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexCoordVertexDataNode;116;-4048,1536;Inherit;False;1;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GrabScreenPosition;113;-4080,1824;Inherit;False;0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;542;80,10672;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;698;144,10816;Inherit;False;696;toogle_custom_noise;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;777;-4048,18320;Inherit;False;World;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldNormalVector;772;-4080,18096;Inherit;False;True;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;198;-3744,6048;Inherit;False;Property;_uv_dis;溶解uv;79;0;Create;False;0;3;uv1;0;uv2;1;uv_screen;2;0;True;2;KWEnum(g5,uv1,_0,uv2,_1,uv_screen,_2);Advanced(UV);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;553;-736,12448;Inherit;False;custom;-1;;287;779eb99551fb15b4496badaf8a633e05;0;1;5;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;392;-848,12288;Inherit;False;Property;_noise_intensity_dis;溶解扰动强度;127;0;Create;False;0;0;0;False;1;Sub(g6);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;453;-2064,9648;Inherit;True;Property;_noise;扰动贴图;106;0;Create;False;0;0;0;False;1;Sub(g6);False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RegisterLocalVarNode;659;-1632,9168;Inherit;False;noiseuv;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;670;-1856,11024;Inherit;False;noisemask_alpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;675;-1840,11968;Inherit;False;noisemasktex;-1;True;1;0;SAMPLER2D;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;686;-1920,9888;Inherit;False;noise_offset;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;652;-1904,9984;Inherit;False;noisetex_alpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;681;-1872,10880;Inherit;False;noisemask_mode;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;860;-3872,19280;Inherit;False;Tangent;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;859;-3840,19168;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;535;160,9600;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;997;217.7696,9730.409;Inherit;False;Constant;_Float12;Float 12;215;0;Create;True;0;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;121;-4224,2416;Inherit;False;Property;_customsuby;y轴offset;55;0;Create;False;0;8;custom1x;0;custom1y;1;custom1z;2;custom1w;3;custom2x;4;custom2y;5;custom2z;6;custom2w;7;0;False;2;SubKeywordEnumDrawer(g3,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w);Advanced(Custom);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;118;-3536,1712;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;119;-3632,1504;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;117;-3696,1840;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;544;336,10544;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;999;416,10752;Inherit;False;Constant;_Float13;Float 12;215;0;Create;True;0;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;920;-3824,18192;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;203;-3744,5872;Inherit;False;1;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GrabScreenPosition;204;-3776,6160;Inherit;False;0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexCoordVertexDataNode;202;-3744,5744;Inherit;False;0;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;201;-3456,6048;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;552;-416,12352;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;700;-374.1378,12498.79;Inherit;False;696;toogle_custom_noise;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;647;-1808,9648;Inherit;False;noisetex;-1;True;1;0;SAMPLER2D;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.RangedFloatNode;122;-4224,2320;Inherit;False;Property;_customsubx;x轴offset;54;0;Create;False;0;8;custom1x;0;custom1y;1;custom1z;2;custom1w;3;custom2x;4;custom2y;5;custom2z;6;custom2w;7;0;False;2;SubKeywordEnumDrawer(g3,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w);Advanced(Custom);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;856;-3824,18896;Inherit;False;855;uv_mantex;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TexturePropertyNode;857;-4032,18976;Inherit;True;Property;_parallaxmap;视差贴图(高度图);196;1;[NoScaleOffset];Create;False;0;0;0;False;2;Sub(ga3);Helpbox(custom add tangent);False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RegisterLocalVarNode;665;-1552,11168;Inherit;False;noisemaskuv;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;666;-1184,9328;Inherit;False;665;noisemaskuv;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;653;-1184,9424;Inherit;False;652;noisetex_alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;648;-1184,9056;Inherit;False;647;noisetex;1;0;OBJECT;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.GetLocalVarNode;676;-1200,9168;Inherit;False;675;noisemasktex;1;0;OBJECT;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.GetLocalVarNode;671;-1168,9504;Inherit;False;670;noisemask_alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;682;-1168,9584;Inherit;False;681;noisemask_mode;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;687;-1136,9664;Inherit;False;686;noise_offset;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;660;-1184,9248;Inherit;False;659;noiseuv;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ParallaxOcclusionMappingNode;854;-3520,18960;Inherit;False;0;128;False;;128;False;;10;0.02;0;False;1,1;False;0,0;11;0;FLOAT2;0,0;False;1;SAMPLER2D;;False;7;SAMPLERSTATE;;False;2;FLOAT;0.02;False;3;FLOAT3;0,0,0;False;8;INT;0;False;9;INT;0;False;10;INT;0;False;4;FLOAT;0;False;5;FLOAT2;0,0;False;6;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;996;368,9632;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;124;-3936,2416;Inherit;False;custom;-1;;288;779eb99551fb15b4496badaf8a633e05;0;1;5;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;123;-3936,2320;Inherit;False;custom;-1;;289;779eb99551fb15b4496badaf8a633e05;0;1;5;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;125;-4000,2112;Inherit;False;Property;_subtex_ST;_subtex_ST;42;1;[HideInInspector];Create;True;0;0;0;False;1;Sub(g3);False;1,1,0,0;1,1,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;667;-1328,10432;Inherit;False;665;noisemaskuv;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;662;-1120,10384;Inherit;False;659;noiseuv;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;655;-1152,10512;Inherit;False;652;noisetex_alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;672;-1200,10624;Inherit;False;670;noisemask_alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;678;-1152,10256;Inherit;False;675;noisemasktex;1;0;OBJECT;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.GetLocalVarNode;688;0,10448;Inherit;False;686;noise_offset;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;683;-624,10656;Inherit;False;681;noisemask_mode;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;120;-3312,1728;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;975;-3152,1808;Inherit;False;969;flowmapuv;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;977;-3216,1888;Inherit;False;971;flowmap_intensity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;998;576,10656;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.AbsOpNode;921;-3600,18192;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;199;-4320,6672;Inherit;False;Property;_customdisx;x轴offset;93;0;Create;False;0;8;custom1x;0;custom1y;1;custom1z;2;custom1w;3;custom2x;4;custom2y;5;custom2z;6;custom2w;7;0;False;2;SubKeywordEnumDrawer(g5,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w);Advanced(Custom);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;200;-4320,6768;Inherit;False;Property;_customdisy;y轴offset;94;0;Create;False;0;8;custom1x;0;custom1y;1;custom1z;2;custom1w;3;custom2x;4;custom2y;5;custom2z;6;custom2w;7;0;False;2;SubKeywordEnumDrawer(g5,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w);Advanced(Custom);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;209;-3328,5840;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;210;-3392,6176;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;554;-160,12224;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1003;-37.18062,12358.28;Inherit;False;Constant;_Float15;Float 12;215;0;Create;True;0;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;208;-3248,6016;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;649;-1120,10144;Inherit;False;647;noisetex;1;0;OBJECT;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.FunctionNode;565;384,9232;Inherit;False;normal creat sry;-1;;290;b0bcd7894c617df40a7b95ad1730ffb2;0;9;8;SAMPLER2D;0;False;34;SAMPLER2D;0;False;24;FLOAT2;0,0;False;49;FLOAT2;0,0;False;11;FLOAT;0.5;False;12;FLOAT;2;False;32;FLOAT;1;False;48;FLOAT;1;False;65;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;862;-3056,18960;Inherit;False;parallax;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector4Node;126;-2992,2416;Inherit;False;Property;_speed_skew_subtex;副贴图流动&斜切;45;0;Create;False;0;0;0;False;2;Sub(g3);Advanced(UV);False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;127;-3600,2208;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;128;-3600,2352;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;129;-3728,2512;Inherit;False;Property;_customtoogle_suboffset;custom控制offset;53;0;Create;False;0;0;0;False;5;SubToggle(g3, _);Advanced(Custom);Helpbox(add uv2);Helpbox(custom1xyzw);Helpbox(custom2xyzw);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;976;-2816,1776;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;989;-2784,1920;Inherit;False;Property;_flowmaptoggle_sub;副贴图flowmap;244;0;Create;False;0;0;0;False;2;SubToggle(ga6, _);Advanced(toggle);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;922;-3472,18192;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;205;-4032,6768;Inherit;False;custom;-1;;304;779eb99551fb15b4496badaf8a633e05;0;1;5;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;206;-4032,6672;Inherit;False;custom;-1;;305;779eb99551fb15b4496badaf8a633e05;0;1;5;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;207;-4096,6464;Inherit;False;Property;_dis_ST;_dis_ST;77;1;[HideInInspector];Create;True;0;0;0;False;1;Sub(g5);False;1,1,0,0;1,1,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;664;-1040,11904;Inherit;False;659;noiseuv;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;657;-1152,12048;Inherit;False;652;noisetex_alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;669;-1104,11968;Inherit;False;665;noisemaskuv;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;674;-1104,12176;Inherit;False;670;noisemask_alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;651;-1072,11744;Inherit;False;647;noisetex;1;0;OBJECT;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.GetLocalVarNode;680;-1088,11808;Inherit;False;675;noisemasktex;1;0;OBJECT;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.GetLocalVarNode;685;-590.7161,12166.62;Inherit;False;681;noisemask_mode;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;690;-288,11968;Inherit;False;686;noise_offset;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1002;113.0498,12259.87;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;215;-3024,5936;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;983;-3088,6224;Inherit;False;971;flowmap_intensity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;981;-3008,6144;Inherit;False;969;flowmapuv;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;1172;-866,20542;Inherit;False;3556;1538.666;normal;37;1138;1140;1139;1141;1142;1143;1144;1146;1145;1147;1148;1149;1150;1151;1152;1154;1153;1155;1156;1157;1158;1163;1159;1164;1160;1161;1167;1165;1168;1166;1169;1162;1137;1176;1177;1179;1180;normal;1,1,1,1;0;0
Node;AmplifyShaderEditor.FunctionNode;563;608,10320;Inherit;False;normal creat sry;-1;;297;b0bcd7894c617df40a7b95ad1730ffb2;0;9;8;SAMPLER2D;0;False;34;SAMPLER2D;0;False;24;FLOAT2;0,0;False;49;FLOAT2;0,0;False;11;FLOAT;0.5;False;12;FLOAT;2;False;32;FLOAT;1;False;48;FLOAT;1;False;65;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;393;1072,9280;Inherit;False;noise_main;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;872;-2512,-256;Inherit;False;862;parallax;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;873;-2492,-160;Inherit;False;Property;_toggle_parallax;视差开关;195;0;Create;False;0;0;0;True;1;KWEnum(ga3,Off,_0,On,_1);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;137;-2544,2448;Inherit;False;Property;_polar_subtex;副贴图极坐标;47;0;Create;False;0;0;0;False;2;SubToggle(g3, _);Advanced(UV);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;133;-2528,2528;Inherit;False;Property;_clampx_subtex;xclamp;49;0;Create;False;0;0;0;False;2;SubToggle(g3, _);Advanced(Clamp);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;132;-2528,2608;Inherit;False;Property;_clampy_subtex;yclamp;50;0;Create;False;0;0;0;False;2;SubToggle(g3, _);Advanced(Clamp);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;136;-2528,2688;Inherit;False;Property;_posterizetoogle_subtex;开启像素化;51;0;Create;False;0;0;0;False;2;SubToggle(g3, _);Advanced(posterize);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;131;-2528,2784;Inherit;False;Property;_posterize_subtex;像素化;52;0;Create;False;0;0;0;False;2;Sub(g3);Advanced(posterize);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;138;-2976,2288;Inherit;False;Property;_rotate_subtex;副贴图旋转;48;0;Create;False;0;0;0;False;2;Sub(g3);Advanced(UV);False;0;1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;139;-2896,2192;Inherit;False;Property;_scale_subtex;副贴图中心缩放;46;0;Create;False;0;0;0;False;2;Sub(g3);Advanced(UV);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;134;-3600,2096;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;135;-3328,2272;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;130;-2496,2272;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;395;1088,10336;Inherit;False;noise_sub;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;988;-2464,1760;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;784;-3616,18448;Inherit;False;Property;_invertfresnel;反向菲尼尔;191;0;Create;False;0;0;0;False;1;SubToggle(ga2, _);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;923;-3248,18192;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;211;-3696,6560;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;212;-3696,6704;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector4Node;214;-3088,6768;Inherit;False;Property;_speed_skew_dis;溶解流动&斜切;80;0;Create;False;0;0;0;False;2;Sub(g5);Advanced(UV);False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;213;-3824,6896;Inherit;False;Property;_customtoogle_disoffset;custom控制offset;92;0;Create;False;0;0;0;False;6;SubToggle(g5, _);Advanced(Custom);Helpbox(add uv2);Helpbox(custom1xyzw);Helpbox(custom2xyzw);Title(Offset);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;562;128,11856;Inherit;False;normal creat sry;-1;;306;b0bcd7894c617df40a7b95ad1730ffb2;0;9;8;SAMPLER2D;0;False;34;SAMPLER2D;0;False;24;FLOAT2;0,0;False;49;FLOAT2;0,0;False;11;FLOAT;0.5;False;12;FLOAT;2;False;32;FLOAT;1;False;48;FLOAT;1;False;65;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;982;-2736,6080;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;993;-2768,6240;Inherit;False;Property;_flowmaptoggle_dis;溶解flowmap;246;0;Create;False;0;0;0;False;2;SubToggle(ga6, _);Advanced(toggle);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;197;-4306,3214;Inherit;False;3348;1538.8;Mask;39;165;164;163;166;167;168;169;171;172;170;174;175;176;177;178;179;173;187;188;189;190;185;186;180;181;182;183;184;191;192;193;194;401;402;978;979;980;990;991;Mask;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;694;-608,11616;Inherit;False;691;custom_noise;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1138;128,20896;Inherit;False;Property;_uv_normal;法线uv;211;0;Create;False;0;3;uv1;0;uv2;1;uv_screen;2;0;True;2;KWEnum(ga5,uv1,_0,uv2,_1,uv_screen,_2);Advanced(UV);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1139;-816,21600;Inherit;False;Property;_customnormaly;y轴offset;222;0;Create;False;0;8;custom1x;0;custom1y;1;custom1z;2;custom1w;3;custom2x;4;custom2y;5;custom2z;6;custom2w;7;0;False;2;SubKeywordEnumDrawer(ga5,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w);Advanced(Custom);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1140;-816,21504;Inherit;False;Property;_customnormalx;x轴offset;221;0;Create;False;0;8;custom1x;0;custom1y;1;custom1z;2;custom1w;3;custom2x;4;custom2y;5;custom2z;6;custom2w;7;0;False;2;SubKeywordEnumDrawer(ga5,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w);Advanced(Custom);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;398;-2368,-48;Inherit;False;393;noise_main;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;871;-2304,-288;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;111;-2128,1840;Inherit;False;uv;-1;;313;bd08fc3240751e7458a55d201311c21d;0;13;51;FLOAT2;0,0;False;43;FLOAT2;1,1;False;44;FLOAT2;0,0;False;45;FLOAT;1;False;46;FLOAT;0;False;47;FLOAT2;0,0;False;48;FLOAT;0;False;49;FLOAT;0;False;50;FLOAT;0;False;60;FLOAT;0;False;61;FLOAT;0;False;73;FLOAT;0;False;71;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;400;-1968,2240;Inherit;False;395;noise_sub;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;782;-3184,18464;Inherit;False;Property;_fresnelpower;菲尼尔power;189;0;Create;False;0;0;0;False;1;Sub(ga2);False;3;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;779;-3056,18256;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;216;-3696,6448;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;217;-3424,6624;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;218;-2592,6624;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;222;-2624,6880;Inherit;False;Property;_clampx_dis;xclamp;84;0;Create;False;0;0;0;False;2;SubToggle(g5, _);Advanced(Clamp);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;223;-2624,6960;Inherit;False;Property;_clampy_dis;yclamp;85;0;Create;False;0;0;0;False;2;SubToggle(g5, _);Advanced(Clamp);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;224;-2624,7040;Inherit;False;Property;_posterizetoogle_dis;开启像素化;86;0;Create;False;0;0;0;False;2;SubToggle(g5, _);Advanced(posterize);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;225;-2624,7136;Inherit;False;Property;_posterize_dis;像素化;87;0;Create;False;0;0;0;False;2;Sub(g5);Advanced(posterize);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;992;-2480,6064;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;548;-304,11600;Inherit;False;custom;-1;;315;779eb99551fb15b4496badaf8a633e05;0;1;5;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;387;-416,11408;Inherit;False;Property;_noise_intensity_mask;mask扰动强度;126;0;Create;False;0;0;0;False;1;Sub(g6);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;165;-4128,3568;Inherit;False;Property;_uv_mask;Maskuv;63;0;Create;False;0;3;uv1;0;uv2;1;uv_screen;2;0;True;2;KWEnum(g4,uv1,_0,uv2,_1,uv_screen,_2);Advanced(UV);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;219;-3072,6640;Inherit;False;Property;_rotate_dis;溶解旋转;83;0;Create;False;0;0;0;False;2;Sub(g5);Advanced(UV);False;0;1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;220;-2992,6544;Inherit;False;Property;_scale_dis;溶解中心缩放;81;0;Create;False;0;0;0;False;2;Sub(g5);Advanced(UV);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;221;-2640,6800;Inherit;False;Property;_polar_dis;溶解极坐标;82;0;Create;False;0;0;0;False;2;SubToggle(g5, _);Advanced(UV);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;396;704,11856;Inherit;False;noise_dis;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;1141;128,20720;Inherit;False;1;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;1142;-528,21600;Inherit;False;custom;-1;;363;779eb99551fb15b4496badaf8a633e05;0;1;5;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;1144;128,20592;Inherit;False;0;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1146;464,20896;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GrabScreenPosition;1145;96,21008;Inherit;False;0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;1147;-592,21296;Inherit;False;Property;_normalmap_ST;_normalmap_ST;210;1;[HideInInspector];Create;True;0;0;0;False;1;Sub(ga5);False;1,1,0,0;1,1,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;1143;-528,21504;Inherit;False;custom;-1;;364;779eb99551fb15b4496badaf8a633e05;0;1;5;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1177;1392,21456;Inherit;False;Property;_customnormal_scale;cuatom法线强度;224;0;Create;False;0;8;custom1x;0;custom1y;1;custom1z;2;custom1w;3;custom2x;4;custom2y;5;custom2z;6;custom2w;7;0;False;2;SubKeywordEnumDrawer(ga5,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w);Advanced(Custom);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;397;-2080,-208;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TexturePropertyNode;1047;-2656,-736;Inherit;True;Property;_maintex;主贴图;20;0;Create;False;0;0;0;False;1;Sub(g2);False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SimpleAddOpNode;399;-1760,1920;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;781;-2896,18400;Inherit;False;Property;_fresnelscale;菲尼尔scale;190;0;Create;False;0;0;0;False;1;Sub(ga2);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;924;-2832,18224;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;926;-4082,19630;Inherit;False;2340;1090.666;depthfade;22;891;893;885;894;895;890;889;896;884;886;888;898;887;900;906;907;897;902;905;899;908;914;depthfade;1,1,1,1;0;0
Node;AmplifyShaderEditor.FunctionNode;226;-2224,6192;Inherit;False;uv;-1;;365;bd08fc3240751e7458a55d201311c21d;0;13;51;FLOAT2;0,0;False;43;FLOAT2;1,1;False;44;FLOAT2;0,0;False;45;FLOAT;1;False;46;FLOAT;0;False;47;FLOAT2;0,0;False;48;FLOAT;0;False;49;FLOAT;0;False;50;FLOAT;0;False;60;FLOAT;0;False;61;FLOAT;0;False;73;FLOAT;0;False;71;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;404;-1869.238,6496.076;Inherit;False;396;noise_dis;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;995;-2704,7664;Inherit;False;Property;_flowmaptoggle_disdir;溶解方向flowmap;247;0;Create;False;0;0;0;False;2;SubToggle(ga6, _);Advanced(toggle);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;166;-3792,3568;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;167;-4128,3264;Inherit;False;0;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexCoordVertexDataNode;168;-4128,3392;Inherit;False;1;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GrabScreenPosition;169;-4160,3680;Inherit;False;0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;547;16,11504;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;699;79.94214,11660.64;Inherit;False;696;toogle_custom_noise;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1148;544,20688;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;1149;-192,21392;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;1150;-192,21536;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SaturateNode;1151;624,20896;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;1152;480,21024;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector4Node;1153;416,21600;Inherit;False;Property;_speed_skew_normal;normal贴图流动&斜切;212;0;Create;False;0;0;0;False;2;Sub(ga5);Advanced(UV);False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1154;-320,21728;Inherit;False;Property;_customtoogle_normaloffset;custom控制offset;220;0;Create;False;0;0;0;False;6;SubToggle(ga5, _);Advanced(Custom);Helpbox(add uv2);Helpbox(custom1xyzw);Helpbox(custom2xyzw);Title(Offset);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1179;1664,21584;Inherit;False;Property;_customtoogle_normal;custom控制法线强度;223;0;Create;False;0;0;0;False;3;SubToggle(ga5, _);Advanced(Custom);Title(NormalScale);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1167;1712,21328;Inherit;False;Property;_noraml_scale;法线强度;225;0;Create;False;0;0;0;False;2;Sub(ga5);Title(NormalScale);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1180;1648,21456;Inherit;False;custom;-1;;367;779eb99551fb15b4496badaf8a633e05;0;1;5;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;17;-1584,-192;Inherit;True;Property;_maintex222;主贴图;10;0;Create;False;0;0;0;False;1;Sub(g2);False;-1;None;None;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;45;-1440,192;Inherit;False;Property;_alpha_maintex;主贴图通道;22;0;Create;False;0;4;A;0;R;1;G;2;B;3;0;True;1;KWEnum(g2,A,_0,R,_1,G,_2,B,_3);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;109;-1632,1888;Inherit;True;Property;_subtex;副贴图;41;0;Create;False;0;0;0;False;1;Sub(g3);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;141;-1472,2112;Inherit;False;Property;_alpha_subtex;副贴图通道;43;0;Create;False;0;4;A;0;R;1;G;2;B;3;0;True;1;KWEnum(g3,A,_0,R,_1,G,_2,B,_3);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;925;-2640,18208;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;249;-2944,7872;Inherit;False;Property;_rotate_disdir;溶解方向旋转;90;0;Create;False;0;0;0;False;2;Sub(g5);Advanced(dissolove_direction);False;0;1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;257;-2736,8032;Inherit;False;Property;_polar_disdir;溶解方向极坐标;91;0;Create;False;0;0;0;False;2;SubToggle(g5, _);Advanced(dissolove_direction);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;403;-1824,6304;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PosVertexDataNode;891;-4016,20352;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;994;-2432,7600;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;164;-4256,4176;Inherit;False;Property;_custommaskx;x轴offset;73;0;Create;False;0;8;custom1x;0;custom1y;1;custom1z;2;custom1w;3;custom2x;4;custom2y;5;custom2z;6;custom2w;7;0;False;2;SubKeywordEnumDrawer(g4,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w);Advanced(Custom);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;163;-4256,4272;Inherit;False;Property;_custommasky;y轴offset;74;0;Create;False;0;8;custom1x;0;custom1y;1;custom1z;2;custom1w;3;custom2x;4;custom2y;5;custom2z;6;custom2w;7;0;False;2;SubKeywordEnumDrawer(g4,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w);Advanced(Custom);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;174;-3616,3568;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;175;-3712,3360;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;176;-3776,3696;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;549;272,11376;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1001;352,11536;Inherit;False;Constant;_Float14;Float 12;215;0;Create;True;0;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;314;-1136,6704;Inherit;False;Property;_customdis;溶解;97;0;Create;False;0;8;custom1x;0;custom1y;1;custom1z;2;custom1w;3;custom2x;4;custom2y;5;custom2z;6;custom2w;7;0;False;2;SubKeywordEnumDrawer(g5,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w);Advanced(Custom);False;4;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1155;864,20960;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;1156;-192,21280;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;1157;80,21456;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;1158;896,21408;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;1163;512,21376;Inherit;False;Property;_scale_normal;normal中心缩放;213;0;Create;False;0;0;0;False;2;Sub(ga5);Advanced(UV);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1159;432,21472;Inherit;False;Property;_rotate_normal;normal贴图旋转;215;0;Create;False;0;0;0;False;2;Sub(ga5);Advanced(UV);False;0;1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1164;864,21632;Inherit;False;Property;_polar_normal;normal贴图极坐标;214;0;Create;False;0;0;0;False;2;SubToggle(ga5, _);Advanced(UV);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1160;880,21712;Inherit;False;Property;_clampx_normal;xclamp;216;0;Create;False;0;0;0;False;2;SubToggle(ga5, _);Advanced(Clamp);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1161;880,21792;Inherit;False;Property;_clampy_normal;yclamp;217;0;Create;False;0;0;0;False;2;SubToggle(ga5, _);Advanced(Clamp);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1176;1904,21328;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;893;-4000,20528;Inherit;False;Property;_Depthfade_distance;羽化距离;201;0;Create;False;0;0;0;False;1;Sub(ga4);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;77;-2320,-880;Inherit;False;Constant;_Float3;Float 3;25;0;Create;True;0;0;0;False;0;False;0.01;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;75;-2304,-816;Inherit;False;Property;_sesan;色散;33;0;Create;False;0;0;0;False;2;Sub(g2);Advanced(Color);False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.FunctionNode;44;-1216,96;Inherit;False;split_rgba;-1;;368;67fbc773f5fd53d47911103a1c19deb3;0;5;78;FLOAT;0;False;75;FLOAT;0;False;76;FLOAT;0;False;77;FLOAT;0;False;79;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;140;-1184,1920;Inherit;False;split_rgba;-1;;369;67fbc773f5fd53d47911103a1c19deb3;0;5;78;FLOAT;0;False;75;FLOAT;0;False;76;FLOAT;0;False;77;FLOAT;0;False;79;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;775;-2432,18192;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;244;-2224,7648;Inherit;False;uv;-1;;370;bd08fc3240751e7458a55d201311c21d;0;13;51;FLOAT2;0,0;False;43;FLOAT2;1,1;False;44;FLOAT2;0,0;False;45;FLOAT;1;False;46;FLOAT;0;False;47;FLOAT2;0,0;False;48;FLOAT;0;False;49;FLOAT;0;False;50;FLOAT;0;False;60;FLOAT;0;False;61;FLOAT;0;False;73;FLOAT;0;False;71;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;228;-1568,6464;Inherit;False;Property;_alpha_dis;溶解通道;78;0;Create;False;0;4;A;0;R;1;G;2;B;3;0;True;1;KWEnum(g5,A,_0,R,_1,G,_2,B,_3);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;227;-1616,6176;Inherit;True;Property;_dis;溶解贴图;76;0;Create;False;0;0;0;False;1;Sub(g5);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.PosVertexDataNode;885;-4032,19920;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;894;-4032,20080;Inherit;False;Property;_camDepthfade_distance1;相机羽化距离;206;0;Create;False;0;0;0;False;1;Sub(ga4);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;895;-4032,20176;Inherit;False;Property;_camDepthfade_offset;相机羽化偏移;207;0;Create;False;0;0;0;False;1;Sub(ga4);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;171;-3968,4272;Inherit;False;custom;-1;;372;779eb99551fb15b4496badaf8a633e05;0;1;5;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;172;-3968,4176;Inherit;False;custom;-1;;373;779eb99551fb15b4496badaf8a633e05;0;1;5;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;170;-4032,3968;Inherit;False;Property;_mask_ST;_mask_ST;61;1;[HideInInspector];Create;True;0;0;0;False;1;Sub(g4);False;1,1,0,0;1,1,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;668;-1328,10960;Inherit;False;665;noisemaskuv;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;663;-1056,10960;Inherit;False;659;noiseuv;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;656;-1088,11072;Inherit;False;652;noisetex_alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;673;-1136,11216;Inherit;False;670;noisemask_alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;650;-1072,10768;Inherit;False;647;noisetex;1;0;OBJECT;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.GetLocalVarNode;679;-1088,10864;Inherit;False;675;noisemasktex;1;0;OBJECT;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.GetLocalVarNode;684;-736,11280;Inherit;False;681;noisemask_mode;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;689;80,11104;Inherit;False;686;noise_offset;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;187;-3392,3552;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;978;-3296,3680;Inherit;False;969;flowmapuv;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;980;-3344,3760;Inherit;False;971;flowmap_intensity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1000;496,11440;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;272;-1072,6608;Inherit;False;Property;_dis_s;溶解;101;0;Create;False;0;0;0;False;1;Sub(g5);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;315;-960,6704;Inherit;False;custom;-1;;376;779eb99551fb15b4496badaf8a633e05;0;1;5;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;316;-1072,6816;Inherit;False;Property;_customtoogle_dis;custom控制溶解;95;0;Create;False;0;0;0;False;3;SubToggle(g5, _);Advanced(Custom);Title(Dissolove);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.VertexColorNode;1208;-1120,6896;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DepthFade;890;-3712,20368;Inherit;False;True;True;False;2;1;FLOAT3;0,0,0;False;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;1165;1472,20976;Inherit;False;uv;-1;;377;bd08fc3240751e7458a55d201311c21d;0;13;51;FLOAT2;0,0;False;43;FLOAT2;1,1;False;44;FLOAT2;0,0;False;45;FLOAT;1;False;46;FLOAT;0;False;47;FLOAT2;0,0;False;48;FLOAT;0;False;49;FLOAT;0;False;50;FLOAT;0;False;60;FLOAT;0;False;61;FLOAT;0;False;73;FLOAT;0;False;71;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1168;1952,21184;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;76;-2112,-880;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;1040;-3584,23776;Inherit;False;Property;_loopflow_speed;speed;254;0;Create;False;0;0;0;False;1;Sub(ga6);False;0.3;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1039;-3584,23664;Inherit;False;Property;_loopflow_strength;strength;253;0;Create;False;0;0;0;False;1;Sub(ga6);False;0.3;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;155;-640,1360;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;153;-608,960;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;156;-48,1472;Inherit;False;Property;_texblendalphaswitch;alpha选择;58;0;Create;False;0;0;0;False;1;SubKeywordEnumDrawer(g3,main,sub,add,multiply);False;3;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;254;-1696,7504;Inherit;True;Property;_disdir;溶解方向;88;0;Create;False;0;0;0;False;2;Ramp(g5);Advanced(dissolove_direction);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.FunctionNode;229;-1264,6256;Inherit;False;split_rgba;-1;;379;67fbc773f5fd53d47911103a1c19deb3;0;5;78;FLOAT;0;False;75;FLOAT;0;False;76;FLOAT;0;False;77;FLOAT;0;False;79;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;889;-3456,20432;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CameraDepthFade;884;-3712,19968;Inherit;False;3;2;FLOAT3;0,0,0;False;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;896;-3696,20592;Inherit;False;Property;_Depthfadeinvert_toggle;反向;202;0;Create;False;0;0;0;False;1;SubToggle(ga4, _);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;794;-2192,18144;Inherit;False;fresnel;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;177;-3632,4064;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;178;-3632,4208;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;179;-3760,4368;Inherit;False;Property;_customtoogle_maskoffset;custom控制offset;72;0;Create;False;0;0;0;False;5;SubToggle(g4, _);Advanced(Custom);Helpbox(add uv2);Helpbox(custom1xyzw);Helpbox(custom2xyzw);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;173;-3024,4272;Inherit;False;Property;_speed_skew_mask;Mask流动&斜切;64;0;Create;False;0;0;0;False;2;Sub(g4);Advanced(UV);False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;564;448,10992;Inherit;False;normal creat sry;-1;;380;b0bcd7894c617df40a7b95ad1730ffb2;0;9;8;SAMPLER2D;0;False;34;SAMPLER2D;0;False;24;FLOAT2;0,0;False;49;FLOAT2;0,0;False;11;FLOAT;0.5;False;12;FLOAT;2;False;32;FLOAT;1;False;48;FLOAT;1;False;65;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;979;-2960,3664;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;991;-2816,3760;Inherit;False;Property;_flowmaptoggle_mask;Maskflowmap;245;0;Create;False;0;0;0;False;2;SubToggle(ga6, _);Advanced(toggle);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;264;-896,6304;Inherit;False;Property;_disdir_blend;溶解方向混合;89;0;Create;False;0;0;0;False;2;Sub(g5);Advanced(dissolove_direction);False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;313;-672,6656;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1209;-688,6928;Inherit;False;Property;_alphatoogle_dis;粒子alpha控制溶解;96;0;Create;False;0;0;0;False;2;SubToggle(g5, _);Advanced(Custom);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;1210;-832,6864;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1166;2080,20944;Inherit;True;Property;_normalmap;法线贴图;209;0;Create;False;0;0;0;False;1;Sub(ga5);False;-1;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.CommentaryNode;1242;-4658,20926;Inherit;False;3236;1602;npr;36;1173;937;1226;943;938;1227;939;1228;1229;946;940;1230;948;957;1224;960;1225;929;954;1232;941;955;1231;933;1233;942;1236;1237;1241;1234;934;1086;1088;1239;1085;962;npr;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1063;-1298,-1634;Inherit;False;1172;482.6666;loopflow;7;1053;1051;1046;1045;1052;1050;1049;loopflow;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;78;-1808,-496;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT2;0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;74;-1808,-912;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT2;0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1041;-3344,23664;Inherit;False;loopflow_strength;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1042;-3328,23776;Inherit;False;loopflow_speed;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;152;304,1200;Inherit;False;split_rgba;-1;;387;67fbc773f5fd53d47911103a1c19deb3;0;5;78;FLOAT;0;False;75;FLOAT;0;False;76;FLOAT;0;False;77;FLOAT;0;False;79;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;886;-3408,19984;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;888;-3200,20352;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;803;752,1504;Inherit;True;794;fresnel;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;188;-3632,3952;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;189;-3360,4128;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;190;-2528,4128;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;186;-2928,4048;Inherit;False;Property;_scale_Mask;Mask中心缩放;65;0;Create;False;0;0;0;False;2;Sub(g4);Advanced(UV);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;183;-2560,4544;Inherit;False;Property;_posterizetoogle_mask;开启像素化;70;0;Create;False;0;0;0;False;2;SubToggle(g4, _);Advanced(posterize);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;184;-2560,4640;Inherit;False;Property;_posterize_mask;像素化;71;0;Create;False;0;0;0;False;2;Sub(g4);Advanced(posterize);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;394;1008,11008;Inherit;False;noise_mask;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;990;-2528,3632;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;181;-2560,4384;Inherit;False;Property;_clampx_mask;xclamp;68;0;Create;False;0;0;0;False;2;SubToggle(g4, _);Advanced(Clamp);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;182;-2560,4464;Inherit;False;Property;_clampy_mask;yclamp;69;0;Create;False;0;0;0;False;2;SubToggle(g4, _);Advanced(Clamp);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;185;-3008,4144;Inherit;False;Property;_rotate_mask;Mask旋转;67;0;Create;False;0;0;0;False;2;Sub(g4);Advanced(UV);False;0;1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;180;-2576,4304;Inherit;False;Property;_polar_mask;Mask极坐标;66;0;Create;False;0;0;0;False;2;SubToggle(g4, _);Advanced(UV);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;311;-144,6816;Inherit;False;Property;_customdissoft;溶解软硬;99;0;Create;False;0;8;custom1x;0;custom1y;1;custom1z;2;custom1w;3;custom2x;4;custom2y;5;custom2z;6;custom2w;7;0;False;2;SubKeywordEnumDrawer(g5,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w);Advanced(Custom);False;4;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;263;-464,6224;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;271;-448,6496;Inherit;False;Constant;_Float8;Float 8;85;0;Create;True;0;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;266;-368,6368;Inherit;False;Constant;_Float7;Float 7;85;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1207;-432,6736;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1169;2448,20944;Inherit;False;normal;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;71;-1616,-896;Inherit;True;Property;_maintex444;主贴图;11;0;Create;False;0;0;0;False;1;Sub(g2);False;-1;None;None;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;73;-1584,-592;Inherit;True;Property;_maintex1111;主贴图;13;0;Create;False;0;0;0;False;1;Sub(g2);False;-1;None;None;True;0;False;white;Auto;False;Instance;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.TexCoordVertexDataNode;1053;-1248,-1584;Inherit;False;0;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;1051;-1136,-1456;Inherit;False;969;flowmapuv;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;1046;-1136,-1360;Inherit;False;1041;loopflow_strength;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1045;-1120,-1264;Inherit;False;1042;loopflow_speed;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;887;-3088,20128;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;838;1104,1488;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;191;-2160,3696;Inherit;False;uv;-1;;388;bd08fc3240751e7458a55d201311c21d;0;13;51;FLOAT2;0,0;False;43;FLOAT2;1,1;False;44;FLOAT2;0,0;False;45;FLOAT;1;False;46;FLOAT;0;False;47;FLOAT2;0,0;False;48;FLOAT;0;False;49;FLOAT;0;False;50;FLOAT;0;False;60;FLOAT;0;False;61;FLOAT;0;False;73;FLOAT;0;False;71;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;402;-1840,4032;Inherit;False;394;noise_mask;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;312;64,6816;Inherit;False;custom;-1;;390;779eb99551fb15b4496badaf8a633e05;0;1;5;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;310;64,6912;Inherit;False;Property;_customtoogle_dissoft;custom控制溶解软硬;98;0;Create;False;0;0;0;False;3;SubToggle(g5, _);Advanced(Custom);Title(DissoloveSoft);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;275;0,6720;Inherit;False;Property;_Float9;溶解软硬;100;0;Create;False;0;0;0;False;2;Sub(g5);Title(dissolove);False;0.5;0;0;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;269;-160,6496;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;265;-112,6288;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1173;-4608,21168;Inherit;False;1169;normal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;72;-1232,-848;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;1052;-672,-1552;Inherit;False;loopflow;-1;;391;090e19788d4cda342b633b9e202aeeb9;0;5;28;SAMPLER2D;_Sampler281052;False;29;FLOAT2;0,0;False;27;FLOAT2;0,0;False;25;FLOAT;0.3;False;26;FLOAT;0.3;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1050;-560,-1280;Inherit;False;Property;_toogele_loopflow;Loopflow开关;252;0;Create;False;0;0;0;False;2;KWEnum(ga6,Off,_0,On,_1);Title(LoopFlow);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;898;-3440,20608;Inherit;False;depthfade_invert_toggle;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;840;1312,1456;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;825;1120,1344;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;401;-1808,3808;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;897;-2192,20160;Inherit;False;Depthfade;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;810;1216,1040;Inherit;False;Property;_fresnelmode;菲尼尔模式(相乘/相加);192;0;Create;False;0;0;0;False;1;KWEnum(ga2,Multiple,_0,Add,_1);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;267;176,6336;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;309;400,6704;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;937;-4352,21168;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;1226;-4448,21872;Inherit;False;1169;normal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;70;-720,-416;Inherit;False;1076;514.6666;refine;7;47;59;50;52;49;51;48;refine;1,1,1,1;0;0
Node;AmplifyShaderEditor.LerpOp;1049;-304,-1504;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;80;-496,-944;Inherit;False;Property;_desature;去色;32;0;Create;False;0;0;0;False;2;Sub(g2);Advanced(Color);False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;192;-1648,3680;Inherit;True;Property;_mask;Mask;60;0;Create;False;0;0;0;False;1;Sub(g4);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;193;-1504,3968;Inherit;False;Property;_alpha_mask;Mask通道;62;0;Create;False;0;4;A;0;R;1;G;2;B;3;0;True;1;KWEnum(g4,A,_0,R,_1,G,_2,B,_3);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;911;1504,1536;Inherit;False;897;Depthfade;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;827;1472,1344;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;913;1424,1616;Inherit;False;898;depthfade_invert_toggle;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;274;432,6368;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;276;640,6672;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;812;1360,848;Inherit;False;Property;_toggle_fresnel;菲尼尔开关;188;0;Create;False;0;0;0;False;1;KWEnum(ga2,Off,_0,On,_1);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1221;1872,832;Inherit;False;Constant;_Float17;Float 17;251;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.VertexColorNode;1212;1792,928;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1223;1856,1120;Inherit;False;Property;_vertexcolor_toggle;顶点色;14;0;Create;False;0;0;0;False;1;SubToggle(ga7, _);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;943;-4096,21168;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;938;-4288,20976;Inherit;False;True;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldNormalVector;1227;-4192,21872;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;48;-640,-224;Inherit;False;Property;_refiene_power;refiene_power;34;0;Create;True;0;0;0;False;2;Sub(g2);Advanced(Refine);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DesaturateOpNode;79;-32,-1024;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;829;1648,1200;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;194;-1200,3760;Inherit;False;split_rgba;-1;;392;67fbc773f5fd53d47911103a1c19deb3;0;5;78;FLOAT;0;False;75;FLOAT;0;False;76;FLOAT;0;False;77;FLOAT;0;False;79;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;912;1776,1504;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;273;816,6432;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1098;1952,1552;Inherit;False;Property;_Alpha;Alpha;12;0;Create;True;0;0;0;False;1;Sub(ga7);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1222;2128,1056;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;939;-3888,21024;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;1228;-3936,21872;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;1229;-4128,21680;Inherit;False;True;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;946;-4176,21344;Inherit;False;Property;_shadowarea;阴影范围;228;0;Create;False;0;0;0;False;1;Sub(ga5);False;0;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;47;-400,-400;Inherit;False;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;196;2224,1296;Inherit;False;6;6;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;940;-3648,21216;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;1230;-3728,21728;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;948;-3920,21456;Inherit;False;Property;_shadowsoft;阴影软硬;227;0;Create;False;0;0;0;False;1;Sub(ga5);False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;957;-3344,21568;Inherit;False;Property;_shadow_intensity;阴影强度;229;0;Create;False;0;0;0;False;1;Sub(ga5);False;0.5;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1224;-3936,22016;Inherit;False;Property;_lightarea;高光范围;230;0;Create;False;0;0;0;False;1;Sub(ga5);False;-0.8;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;59;-224,-352;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;50;-416,-192;Inherit;False;Property;_refiene_intensity;refiene_提亮;35;0;Create;False;0;0;0;False;2;Sub(g2);Advanced(Refine);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;1065;2352,1088;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;1090;-1296,18032;Inherit;False;1218;481.1992;ramp;7;1066;1213;1215;1068;1070;1069;1218;ramp;1,1,1,1;0;0
Node;AmplifyShaderEditor.OneMinusNode;960;-2960,21552;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1225;-3456,21888;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;929;-3520,21312;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;954;-3136,21120;Inherit;False;Constant;_Color3;Color 1;206;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;1232;-3536,22080;Inherit;False;Property;_lightsoft;高光软硬;231;0;Create;False;0;0;0;False;1;Sub(ga5);False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;49;-32,-288;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;52;-192,-64;Inherit;False;Property;_refine_lerp;refine_lerp;36;0;Create;True;0;0;0;False;2;Sub(g2);Advanced(Refine);False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1064;2528,1088;Inherit;False;ramp_mian;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;1218;-1232,18240;Inherit;False;Property;_rampspeed;ramp流动;18;0;Create;False;0;0;0;False;2;Sub(ga7);Advanced(Ramp);False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;941;-3296,21312;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;955;-2880,21408;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;1231;-3168,21936;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;51;176,-208;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;771;-4192,16768;Inherit;False;2868;922.1992;matcap&cubemap;24;751;750;749;747;748;760;746;757;758;754;759;752;753;756;763;761;762;755;764;767;768;766;765;1175;matcap&cubemap;1,1,1,1;0;0
Node;AmplifyShaderEditor.ColorNode;879;304,32;Inherit;False;Property;_parallax_intcolor;视差内部颜色;199;1;[HDR];Create;False;0;0;0;False;1;Sub(ga3);False;1,1,1,1;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.GetLocalVarNode;1174;-4435.773,16959.12;Inherit;False;1169;normal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1068;-1200,18096;Inherit;False;1064;ramp_mian;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;1215;-1040,18176;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;933;-2688,21264;Inherit;True;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;1233;-2960,21936;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LightColorNode;942;-2688,21056;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.ColorNode;1236;-3040,22032;Inherit;False;Constant;_lightcolor;高光颜色;232;1;[HDR];Create;False;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.LightColorNode;1237;-2928,22368;Inherit;False;0;3;COLOR;0;FLOAT3;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;1241;-2928,22240;Inherit;False;Property;_lightscale;高光强度;232;0;Create;False;0;0;0;False;1;Sub(ga5);False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;876;368,-448;Inherit;False;Property;_parallax_outcolor;视差外部颜色;198;1;[HDR];Create;False;0;0;0;False;1;Sub(ga3);False;0,0,0,1;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;877;448,-192;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WorldNormalVector;751;-4128,16944;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ViewMatrixNode;750;-4144,16816;Inherit;False;0;1;FLOAT4x4;0
Node;AmplifyShaderEditor.RangedFloatNode;1184;3376,1408;Inherit;False;Property;_dis_clip;clip;104;0;Create;False;0;0;0;False;2;Sub(g5);Advanced(alphaclip);False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;1213;-864,18112;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1234;-2480,21904;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;934;-2416,21152;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;875;688,-176;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;749;-3920,16848;Inherit;False;2;2;0;FLOAT4x4;0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;318;-864,7088;Inherit;False;Property;_edge;edge;102;0;Create;True;0;0;0;False;1;Sub(g5);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1202;3712,1408;Inherit;False;clip;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1066;-656,18096;Inherit;True;Property;_ramptex;ramptex;15;0;Create;True;0;0;0;False;3;Ramp(ga7);Advanced(Ramp);Title(Ramp);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;1086;-2224,21008;Inherit;False;Constant;_Float18;Float 18;227;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1239;-2112,21440;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1088;-2080,21296;Inherit;False;Property;_Float19;npr;226;0;Create;False;0;0;0;False;2;SubToggle(ga5, _);Title(Lighting);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;608;-4178,14814;Inherit;False;4036;1538.8;vertexmask;34;568;570;569;571;572;573;574;575;576;577;578;579;580;581;582;584;583;585;586;587;590;589;588;595;594;593;592;591;596;599;597;598;603;602;vertexmask;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;607;-4210,12846;Inherit;False;4100;1538.8;vertex;34;491;493;492;494;495;496;497;498;499;500;501;502;503;504;505;507;506;508;509;510;513;512;511;515;516;517;518;514;519;523;521;524;526;525;vertex;1,1,1,1;0;0
Node;AmplifyShaderEditor.LerpOp;882;752,48;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;747;-3728,16832;Inherit;False;True;True;False;True;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;145;528,384;Inherit;False;Property;_blend;混合强度;57;0;Create;False;0;0;0;False;1;Sub(g3);False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;146;560,464;Inherit;False;Property;_texblendmode;颜色混合模式;56;0;Create;False;0;0;0;False;2;SubKeywordEnumDrawer(g3,ColorDodge,LinearDodge,SoftLight,Multiply,Screen,Overlay);Title(Blend);False;3;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;319;-560,7088;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1203;-592,7264;Inherit;False;1202;clip;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1069;-320,18112;Inherit;False;ramp_rgb;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;1085;-1888,21040;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;713;2272,9760;Inherit;False;691;custom_noise;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;491;-3216,13200;Inherit;False;Property;_uv_vertex;顶点uv;152;0;Create;False;0;3;uv1;0;uv2;1;uv_screen;2;0;True;2;KWEnum(g8,uv1,_0,uv2,_1,uv_screen,_2);Advanced(UV);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;493;-4160,13904;Inherit;False;Property;_customvertexy;y轴offset;163;0;Create;False;0;8;custom1x;0;custom1y;1;custom1z;2;custom1w;3;custom2x;4;custom2y;5;custom2z;6;custom2w;7;0;False;2;SubKeywordEnumDrawer(g8,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w);Advanced(Custom);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;492;-4160,13808;Inherit;False;Property;_customvertexx;x轴offset;162;0;Create;False;0;8;custom1x;0;custom1y;1;custom1z;2;custom1w;3;custom2x;4;custom2y;5;custom2z;6;custom2w;7;0;False;2;SubKeywordEnumDrawer(g8,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w);Advanced(Custom);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;159;1008,352;Inherit;False;blend;-1;;393;3d7f13c937805f9409106db3e830b464;0;4;39;FLOAT3;0,0,0;False;40;FLOAT3;0,0,0;False;43;FLOAT;0;False;44;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;748;-3488,16832;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;1,1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;760;-4032,17392;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;1072;1264,496;Inherit;False;1069;ramp_rgb;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1073;1264,592;Inherit;False;Property;_ramptoggle_rgb;映射颜色;16;0;Create;False;0;0;0;False;2;SubToggle(ga7, _);Advanced(Ramp);False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;568;-3184,15168;Inherit;False;Property;_uv_vertexmask;顶点maskuv;175;0;Create;False;0;3;uv1;0;uv2;1;uv_screen;2;0;True;2;KWEnum(g9,uv1,_0,uv2,_1,uv_screen,_2);Advanced(UV);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1175;-4097.994,17609.98;Inherit;False;1169;normal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;323;-144,7008;Inherit;False;Constant;_Float11;Float 8;85;0;Create;True;0;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;317;-272,7088;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;962;-1664,21056;Inherit;False;npr;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;570;-4128,15776;Inherit;False;Property;_customvertexmaskx;x轴offset;185;0;Create;False;0;8;custom1x;0;custom1y;1;custom1z;2;custom1w;3;custom2x;4;custom2y;5;custom2z;6;custom2w;7;0;False;2;SubKeywordEnumDrawer(g9,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w);Advanced(Custom);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;569;-4128,15872;Inherit;False;Property;_customvertexmasky;y轴offset;186;0;Create;False;0;8;custom1x;0;custom1y;1;custom1z;2;custom1w;3;custom2x;4;custom2y;5;custom2z;6;custom2w;7;0;False;2;SubKeywordEnumDrawer(g9,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w);Advanced(Custom);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;703;2608,9760;Inherit;False;custom;-1;;394;779eb99551fb15b4496badaf8a633e05;0;1;5;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;494;-3216,13024;Inherit;False;1;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;495;-3872,13904;Inherit;False;custom;-1;;395;779eb99551fb15b4496badaf8a633e05;0;1;5;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;496;-3872,13808;Inherit;False;custom;-1;;396;779eb99551fb15b4496badaf8a633e05;0;1;5;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;497;-3216,12896;Inherit;False;0;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GrabScreenPosition;498;-3248,13312;Inherit;False;0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;499;-2880,13200;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;500;-3936,13600;Inherit;False;Property;_vertex_ST;_vertex_ST;150;1;[HideInInspector];Create;True;0;0;0;False;1;Sub(g8);False;1,1,0,0;1,1,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;746;-3328,16848;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.WorldNormalVector;757;-3760,17504;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.NegateNode;758;-3792,17392;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;900;-2944,20256;Inherit;False;898;depthfade_invert_toggle;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1071;1584,416;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;571;-3184,14992;Inherit;False;1;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;572;-3840,15872;Inherit;False;custom;-1;;397;779eb99551fb15b4496badaf8a633e05;0;1;5;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;573;-3840,15776;Inherit;False;custom;-1;;398;779eb99551fb15b4496badaf8a633e05;0;1;5;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexCoordVertexDataNode;574;-3184,14864;Inherit;False;0;2;0;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GrabScreenPosition;575;-3216,15280;Inherit;False;0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;576;-2848,15168;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;577;-3904,15568;Inherit;False;Property;_vertexmask_ST;_vertexmask_ST;171;1;[HideInInspector];Create;True;0;0;0;False;1;Sub(g9);False;1,1,0,0;1,1,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;325;112,7088;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;716;2640,9632;Inherit;False;Property;_noise_intensity_screen;屏幕扰动强度;129;0;Create;False;0;0;0;False;1;Sub(g6);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;964;1456,160;Inherit;False;962;npr;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;704;2960,9664;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;714;2880,9824;Inherit;False;696;toogle_custom_noise;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;501;-2800,12992;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;502;-3536,13696;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;503;-3536,13840;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;505;-2864,13328;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector4Node;507;-2928,13904;Inherit;False;Property;_speed_skew_veretx;顶点贴图流动&斜切;153;0;Create;False;0;0;0;False;2;Sub(g8);Advanced(UV);False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;506;-3664,14032;Inherit;False;Property;_customtoogle_vertexoffset;custom控制offset;161;0;Create;False;0;0;0;False;6;SubToggle(g8, _);Advanced(Custom);Helpbox(add uv2);Helpbox(custom1xyzw);Helpbox(custom2xyzw);Title(Offset);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;504;-2704,13200;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;754;-2912,17056;Inherit;False;Property;_matcapdesature;matcap去色;236;0;Create;False;0;0;0;False;1;Sub(ga1);False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ReflectOpNode;759;-3552,17376;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;899;-2656,19984;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;963;1696,160;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;906;-2624,20112;Inherit;False;Property;_Depthfade_invertpower;边缘收窄;203;0;Create;False;0;0;0;False;1;Sub(ga4);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;578;-2768,14960;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;579;-3504,15664;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;580;-3504,15808;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SaturateNode;581;-2688,15168;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;582;-2832,15296;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector4Node;583;-2896,15872;Inherit;False;Property;_speed_skew_veretxmask;顶点mask贴图流动&斜切;176;0;Create;False;0;0;0;False;2;Sub(g9);Advanced(UV);False;0,0,0,0;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;752;-3088,16848;Inherit;True;Property;_Matcap;Matcap;235;0;Create;True;0;0;0;False;2;Sub(ga1);Title(Matcap);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleSubtractOpNode;326;368,7040;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1220;2208,816;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;842;1824,-48;Inherit;False;Property;_color_main;颜色;10;1;[HDR];Create;False;0;0;0;False;1;Sub(ga7);False;1,1,1,1;1,1,1,1;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;584;-3632,16000;Inherit;False;Property;_customtoogle_vertexmaskoffset;custom控制offset;184;0;Create;False;0;0;0;False;6;SubToggle(g9, _);Advanced(Custom);Helpbox(add uv2);Helpbox(custom1xyzw);Helpbox(custom2xyzw);Title(Offset);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;705;3168,9536;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;508;-2480,13264;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;509;-3536,13584;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;510;-3264,13760;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;513;-2912,13776;Inherit;False;Property;_rotate_vertex;顶点贴图旋转;156;0;Create;False;0;0;0;False;2;Sub(g8);Advanced(UV);False;0;1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;512;-2832,13680;Inherit;False;Property;_scale_vertex;顶点贴图中心缩放;154;0;Create;False;0;0;0;False;2;Sub(g8);Advanced(UV);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;511;-2448,13712;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;515;-2464,14176;Inherit;False;Property;_posterizetoogle_vertex;开启像素化;159;0;Create;False;0;0;0;False;2;SubToggle(g8, _);Advanced(posterize);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;516;-2464,14096;Inherit;False;Property;_clampy_vertex;yclamp;158;0;Create;False;0;0;0;False;2;SubToggle(g8, _);Advanced(Clamp);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;517;-2464,14016;Inherit;False;Property;_clampx_vertex;xclamp;157;0;Create;False;0;0;0;False;2;SubToggle(g8, _);Advanced(Clamp);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;518;-2480,13936;Inherit;False;Property;_polar_veretx;顶点贴图极坐标;155;0;Create;False;0;0;0;False;2;SubToggle(g8, _);Advanced(UV);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;514;-2464,14272;Inherit;False;Property;_posterize_vertex;像素化;160;0;Create;False;0;0;0;False;2;Sub(g8);Advanced(posterize);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DesaturateOpNode;753;-2560,16880;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;756;-2544,17104;Inherit;False;Property;_matcap_scale;matcap强度;237;0;Create;False;0;0;0;False;1;Sub(ga1);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;905;-2432,20016;Inherit;False;True;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;908;-2624,19872;Inherit;False;Property;_Depthfade_invertscale;边缘强度;204;0;Create;False;0;0;0;False;1;Sub(ga4);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;914;-2656,19680;Inherit;False;Property;_depthcolor;边缘颜色;205;1;[HDR];Create;False;0;0;0;False;1;Sub(ga4);False;1,1,1,1;1,1,1,1;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;815;2128,80;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;706;1872,9296;Inherit;False;665;noisemaskuv;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;707;1872,9392;Inherit;False;652;noisetex_alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;710;1888,9472;Inherit;False;670;noisemask_alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;711;1888,9552;Inherit;False;681;noisemask_mode;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;712;1920,9632;Inherit;False;686;noise_offset;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;709;1856,9136;Inherit;False;675;noisemasktex;1;0;OBJECT;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.GetLocalVarNode;708;1872,9024;Inherit;False;647;noisetex;1;0;OBJECT;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.GetLocalVarNode;715;1872,9216;Inherit;False;659;noiseuv;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;591;-2432,16240;Inherit;False;Property;_posterize_vertexmask;像素化;183;0;Create;False;0;0;0;False;2;Sub(g9);Advanced(posterize);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;585;-2448,15232;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;586;-3504,15552;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;587;-3232,15728;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;590;-2416,15680;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;588;-2880,15744;Inherit;False;Property;_rotate_vertexmask;顶点mask贴图旋转;179;0;Create;False;0;0;0;False;2;Sub(g9);Advanced(UV);False;0;1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;594;-2432,15984;Inherit;False;Property;_clampx_vertexmask;xclamp;180;0;Create;False;0;0;0;False;2;SubToggle(g9, _);Advanced(Clamp);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;593;-2432,16064;Inherit;False;Property;_clampy_vertexmask;yclamp;181;0;Create;False;0;0;0;False;2;SubToggle(g9, _);Advanced(Clamp);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;592;-2432,16144;Inherit;False;Property;_posterizetoogle_vertexmask;开启像素化;182;0;Create;False;0;0;0;False;2;SubToggle(g9, _);Advanced(posterize);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;589;-2800,15648;Inherit;False;Property;_scale_vertexmask;顶点mask中心缩放;177;0;Create;False;0;0;0;False;2;Sub(g9);Advanced(UV);False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;595;-2448,15904;Inherit;False;Property;_polar_veretxmask;顶点mask贴图极坐标;178;0;Create;False;0;0;0;False;2;SubToggle(g9, _);Advanced(UV);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;763;-2768,17552;Inherit;False;Property;_cube_scale;cube强度;239;0;Create;False;0;0;0;False;1;Sub(ga1);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;761;-3056,17344;Inherit;True;Property;_Cubemap;Cubemap;238;1;[NoScaleOffset];Create;True;0;0;0;False;2;Sub(ga1);Title(Cubemap);False;-1;None;None;True;0;False;white;LockedToCube;False;Object;-1;Auto;Cube;8;0;SAMPLERCUBE;;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SaturateNode;327;544,7040;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;799;1840,528;Inherit;False;794;fresnel;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;806;1840,336;Inherit;False;Property;_ColorFresnel;菲尼尔颜色;193;1;[HDR];Create;False;0;0;0;False;1;Sub(ga2);False;1,1,1,1;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.FunctionNode;519;-1872,13280;Inherit;False;uv;-1;;399;bd08fc3240751e7458a55d201311c21d;0;13;51;FLOAT2;0,0;False;43;FLOAT2;1,1;False;44;FLOAT2;0,0;False;45;FLOAT;1;False;46;FLOAT;0;False;47;FLOAT2;0,0;False;48;FLOAT;0;False;49;FLOAT;0;False;50;FLOAT;0;False;60;FLOAT;0;False;61;FLOAT;0;False;73;FLOAT;0;False;71;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;762;-2464,17376;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;755;-2336,16944;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;907;-2304,19808;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;847;2304,320;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;702;3440,9200;Inherit;False;normal creat sry;-1;;401;b0bcd7894c617df40a7b95ad1730ffb2;0;9;8;SAMPLER2D;0;False;34;SAMPLER2D;0;False;24;FLOAT2;0,0;False;49;FLOAT2;0,0;False;11;FLOAT;0.5;False;12;FLOAT;2;False;32;FLOAT;1;False;48;FLOAT;1;False;65;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;596;-1840,15248;Inherit;False;uv;-1;;408;bd08fc3240751e7458a55d201311c21d;0;13;51;FLOAT2;0,0;False;43;FLOAT2;1,1;False;44;FLOAT2;0,0;False;45;FLOAT;1;False;46;FLOAT;0;False;47;FLOAT2;0,0;False;48;FLOAT;0;False;49;FLOAT;0;False;50;FLOAT;0;False;60;FLOAT;0;False;61;FLOAT;0;False;73;FLOAT;0;False;71;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;1171;3763.475,9643.467;Inherit;False;1169;normal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;1106;3760,9808;Inherit;False;Property;_normalnoise_toggle;使用法线扰动屏幕(法线在下面↓);130;1;[Toggle];Create;False;0;0;0;False;1;SubToggle(g6, _);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;328;864,6880;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;523;-1488,13280;Inherit;True;Property;_vertex;顶点偏移贴图;149;0;Create;False;0;0;0;False;1;Sub(g8);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;521;-1328,13616;Inherit;False;Property;_alpha_vertex;顶点贴图通道;151;0;Create;False;0;4;A;0;R;1;G;2;B;3;0;True;1;KWEnum(g8,A,_0,R,_1,G,_2,B,_3);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;764;-2144,17216;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;767;-2048,16992;Inherit;False;Constant;_Float1;Float 1;180;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;902;-1984,19792;Inherit;False;Depthfade_invert;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;851;2528,288;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GrabScreenPosition;719;3840,8896;Inherit;False;0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;1104;4096,9456;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;599;-1456,15248;Inherit;True;Property;_vertexmask;顶点偏移mask贴图;170;0;Create;False;0;0;0;False;1;Sub(g9);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;597;-1280,15584;Inherit;False;Property;_alpha_vertexmask;顶点mask贴图通道;172;0;Create;False;0;4;A;0;R;1;G;2;B;3;0;True;1;KWEnum(g9,A,_0,R,_1,G,_2,B,_3);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;768;-2064,17360;Inherit;False;Property;_toggle_matcao;反射开关;234;0;Create;False;0;0;0;False;1;KWEnum(ga1,Off,_0,On,_1);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;329;1120,6608;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;524;-1056,13328;Inherit;False;split_rgba;-1;;410;67fbc773f5fd53d47911103a1c19deb3;0;5;78;FLOAT;0;False;75;FLOAT;0;False;76;FLOAT;0;False;77;FLOAT;0;False;79;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;526;-640,13440;Inherit;False;Property;_vertex_remap;remap;167;0;Create;False;0;0;0;False;1;Sub(g8);False;0,1,0,1;0,1,0,1;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;603;-656,15552;Inherit;False;Property;_vertex_remapmask;remap;174;0;Create;False;0;0;0;False;1;Sub(g9);False;0,1,0,1;0,1,0,1;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;720;4192,9184;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.LerpOp;766;-1808,17088;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;910;2672,144;Inherit;False;902;Depthfade_invert;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;850;2720,256;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;330;1568,6976;Inherit;False;dis_edge;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1070;-320,18208;Inherit;False;ramp_a;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;598;-1008,15296;Inherit;False;split_rgba;-1;;411;67fbc773f5fd53d47911103a1c19deb3;0;5;78;FLOAT;0;False;75;FLOAT;0;False;76;FLOAT;0;False;77;FLOAT;0;False;79;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1075;2448,1376;Inherit;False;1070;ramp_a;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;335;2848,704;Inherit;False;330;dis_edge;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;525;-320,13344;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;602;-352,15456;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;559;352,14416;Inherit;False;Property;_customvertexscale;顶点偏移总强度;165;0;Create;False;0;8;custom1x;0;custom1y;1;custom1z;2;custom1w;3;custom2x;4;custom2y;5;custom2z;6;custom2w;7;0;False;2;SubKeywordEnumDrawer(g8,custom1x,custom1y,custom1z,custom1w,custom2x,custom2y,custom2z,custom2w);Advanced(Custom);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScreenColorNode;731;4400,9248;Inherit;False;Global;_GrabScreen2;Grab Screen 2;175;0;Create;True;0;0;0;False;0;False;Object;-1;False;False;False;False;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;765;-1568,17088;Inherit;False;matcap;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;909;2912,224;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;334;2736,432;Inherit;False;Property;_edgecolor;edgecolor;103;1;[HDR];Create;True;0;0;0;False;1;Sub(g5);False;1,1,1,1;1,1,1,1;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;1076;2448,1456;Inherit;False;Property;_ramptoggle_a;映射alpha;17;0;Create;False;0;0;0;False;2;SubToggle(ga7, _);Advanced(Ramp);False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1089;2704,1312;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalVertexDataNode;529;368,13904;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;530;416,14064;Inherit;False;Constant;_Float10;Float 10;147;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;531;416,14144;Inherit;False;Property;_toogele_vertexnormal;顶点法线;166;0;Create;False;0;0;0;False;2;KWEnum(g8,ON,_0,OFF,_1);Title(VertexOffset);False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;601;48,14512;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;604;48,14864;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;560;560,14416;Inherit;False;custom;-1;;412;779eb99551fb15b4496badaf8a633e05;0;1;5;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;333;3152,336;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;770;3072,192;Inherit;False;765;matcap;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;738;4688,9296;Inherit;False;ref;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;606;137.0609,15030.29;Inherit;False;Property;_veretxmaskmode;mask模式(相乘/相加);173;0;Create;False;0;4;A;0;R;1;G;2;B;3;0;True;1;KWEnum(g9,Multiple,_0,Add,_1);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;561;576,14560;Inherit;False;Property;_customtoogle_vertexscale;custom控制顶点偏移总强度;164;0;Create;False;0;0;0;False;3;SubToggle(g8, _);Advanced(Custom);Title(VertexOffset);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;161;2928,1312;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;528;672,13904;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Vector3Node;532;624,14192;Inherit;False;Property;_veretx_intensity;顶点偏移三轴强度;168;0;Create;False;0;0;0;False;1;Sub(g8);False;0,0,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.LerpOp;558;864,14416;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;605;368,14720;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;769;3312,256;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;724;3312,496;Inherit;False;738;ref;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;740;3296,640;Inherit;False;Property;_toggle_ref;折射/扭曲/热扭曲开关;128;0;Create;False;0;0;0;False;2;KWEnum(g6,Off,_0,On,_1);Title(Ref);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1181;512,5936;Inherit;False;clipuv;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1102;2960,1440;Inherit;False;Property;_AlphaClamp;AlphaClamp;13;0;Create;True;0;0;0;False;1;SubToggle(ga7, _);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1219;1039.216,13953.73;Inherit;False;Constant;_Float16;Float 16;251;0;Create;True;0;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1101;3168,1200;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;527;992,13696;Inherit;False;5;5;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;739;3616,400;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1100;3601.896,218.5492;Inherit;False;Property;_color_scale;整体颜色强度;11;0;Create;False;0;0;0;False;1;Sub(ga7);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1183;3456,1200;Inherit;False;1181;clipuv;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClipNode;1182;3696,1056;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;10;-5776,624;Inherit;False;292;834.6666;基础设置;8;3;4;6;5;7;1;8;9;基础设置;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;533;1264,13712;Inherit;False;vertex;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1099;3804.732,300.2674;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.DynamicAppendNode;1078;-2176,18320;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1079;-1984,18320;Inherit;False;ramp_fresnel;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;12;-6160,672;Inherit;False;Property;_group_maintex;主贴图;19;0;Create;False;0;0;0;True;1;Main(g2, _, off, off);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;7;-5712,1184;Inherit;False;Property;_stencil_reference;stencil_reference;8;0;Create;True;0;0;0;True;1;Sub(g1);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;8;-5712,1264;Inherit;False;Property;_stencil_comp;stencil_comp;6;0;Create;False;0;0;0;True;1;SubEnum(g1,UnityEngine.Rendering.CompareFunction);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;9;-5712,1344;Inherit;False;Property;_stencil_pass;stencil_pass;7;0;Create;False;0;0;0;True;1;SubEnum(g1,UnityEngine.Rendering.StencilOp);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;110;-6160,768;Inherit;False;Property;_group_subtex;副贴图;40;0;Create;False;0;0;0;True;1;Main(g3, _, off, off);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;195;-6160,880;Inherit;False;Property;_group_mask;Mask;59;0;Create;False;0;0;0;True;1;Main(g4, _, off, off);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;230;-6160,992;Inherit;False;Property;_group_dis;溶解;75;0;Create;False;0;0;0;True;1;Main(g5, _, off, off);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;382;-6160,1104;Inherit;False;Property;_group_noise;扰动;105;0;Create;False;0;0;0;True;1;Main(g6, _, off, off);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2;-6160,576;Inherit;False;Property;_group_base;基础设置;0;0;Create;False;0;0;0;True;1;Main(g1, _, off, off);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;522;-6160,1312;Inherit;False;Property;_group_vertex;顶点偏移;148;0;Create;False;0;0;0;True;1;Main(g8, _, off, off);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;488;-6160,1216;Inherit;False;Property;_group_noisemask;扰动mask;131;0;Create;False;0;0;0;True;1;Main(g7, _, off, off);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;600;-6160,1424;Inherit;False;Property;_group_vertexmask;顶点偏移mask;169;0;Create;False;0;0;0;True;1;Main(g9, _, off, off);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;730;-6160,1552;Inherit;False;Property;_group_matcap;反射;233;0;Create;False;0;0;0;True;1;Main(ga1, _, off, off);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;853;-6160,1776;Inherit;False;Property;_group_parallax;视差;194;0;Create;False;0;0;0;True;1;Main(ga3, _, off, off);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;6;-5712,1088;Inherit;False;Property;_blendmode;混合模式;2;0;Create;False;0;0;0;True;2;SubEnum(g1,UnityEngine.Rendering.BlendMode);SubEnum(g1,add,1,blend,10);False;10;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5;-5712,1008;Inherit;False;Property;_ztest;深度测试;3;0;Create;False;0;0;0;True;1;SubEnum(g1,UnityEngine.Rendering.CompareFunction);False;4;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;4;-5712,912;Inherit;False;Property;_zwrite;深度写入;4;0;Create;False;0;0;0;True;1;SubToggle(g1,_);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1;-5712,720;Inherit;False;Property;_cullmodeaaaa;剔除模式;1;0;Create;False;0;0;0;True;1;SubEnum(g1,UnityEngine.Rendering.CullMode);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3;-5712,816;Inherit;False;Property;_colormask;colormask;5;0;Create;True;0;0;0;True;1;SubEnum(g1,UnityEngine.Rendering.ColorWriteMask);False;15;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;892;-6160,1888;Inherit;False;Property;_group_depthfade;Depthfade;200;0;Create;False;0;0;0;True;1;Main(ga4, _, off, off);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;966;-6160,2080;Inherit;False;Property;_group_flowmap;Flowmap;240;0;Create;False;0;0;0;True;1;Main(ga6, _, off, off);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1067;-6160,2192;Inherit;False;Property;_group_color;Color&Ramp;9;0;Create;False;0;0;0;True;1;Main(ga7, _, off, off);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1162;880,21872;Inherit;False;Property;_posterizetoogle_normal;开启像素化;219;0;Create;False;0;0;0;False;2;SubToggle(ga5, _);Advanced(posterize);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1137;880,21968;Inherit;False;Property;_posterize_normal;像素化;218;0;Create;False;0;0;0;False;2;Sub(ga5);Advanced(posterize);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;780;-6160,1664;Inherit;False;Property;_group_fresnel;菲尼尔;187;0;Create;False;0;0;0;True;1;Main(ga2, _, off, off);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;947;-6160,1984;Inherit;False;Property;_group_normal;法线;208;0;Create;False;0;0;0;True;1;Main(ga5, _, off, off);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;534;4096,784;Inherit;False;533;vertex;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;18;4256,432;Inherit;False;FLOAT4;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;0;4800,496;Float;False;True;-1;3;LWGUI.LWGUI;100;5;Hotwater/all_2025_unlit;0770190933193b94aaa3065e307002fa;True;Unlit;0;0;Unlit;2;True;True;1;5;False;;10;True;_blendmode;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;True;True;1;True;_cullmodeaaaa;True;True;True;True;True;True;0;True;_colormask;False;False;False;False;False;False;True;True;True;0;True;_stencil_reference;255;False;;255;False;;0;True;_stencil_comp;0;True;_stencil_pass;1;False;;1;False;;0;False;;0;False;;0;False;;0;False;;True;True;1;True;_zwrite;True;3;True;_ztest;True;True;-1;False;;-1;False;;True;2;RenderType=Opaque=RenderType;Queue=Transparent=Queue=0;True;5;False;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;0;1;True;False;;False;0
WireConnection;1060;5;1059;0
WireConnection;26;0;25;0
WireConnection;1058;0;970;0
WireConnection;1058;1;1060;0
WireConnection;1058;2;1061;0
WireConnection;968;0;967;1
WireConnection;968;1;967;2
WireConnection;20;0;19;0
WireConnection;20;1;21;0
WireConnection;20;2;25;0
WireConnection;24;0;23;1
WireConnection;24;1;23;2
WireConnection;27;0;26;0
WireConnection;353;0;350;0
WireConnection;457;0;456;0
WireConnection;969;0;968;0
WireConnection;971;0;1058;0
WireConnection;22;0;20;0
WireConnection;22;1;24;0
WireConnection;22;2;27;0
WireConnection;99;5;98;0
WireConnection;95;5;96;0
WireConnection;360;0;358;0
WireConnection;360;1;354;0
WireConnection;360;2;350;0
WireConnection;361;0;355;1
WireConnection;361;1;355;2
WireConnection;365;0;353;0
WireConnection;464;0;462;0
WireConnection;464;1;458;0
WireConnection;464;2;456;0
WireConnection;468;0;457;0
WireConnection;465;0;459;1
WireConnection;465;1;459;2
WireConnection;973;0;22;0
WireConnection;973;1;972;0
WireConnection;973;2;974;0
WireConnection;356;5;352;0
WireConnection;357;5;351;0
WireConnection;460;5;455;0
WireConnection;461;5;454;0
WireConnection;31;0;29;3
WireConnection;31;1;29;4
WireConnection;100;0;95;0
WireConnection;100;1;99;0
WireConnection;691;0;536;0
WireConnection;367;0;360;0
WireConnection;367;1;361;0
WireConnection;367;2;365;0
WireConnection;471;0;464;0
WireConnection;471;1;465;0
WireConnection;471;2;468;0
WireConnection;362;0;359;3
WireConnection;362;1;359;4
WireConnection;363;0;357;0
WireConnection;363;1;356;0
WireConnection;466;0;463;3
WireConnection;466;1;463;4
WireConnection;467;0;461;0
WireConnection;467;1;460;0
WireConnection;38;0;37;1
WireConnection;38;1;37;2
WireConnection;30;0;29;1
WireConnection;30;1;29;2
WireConnection;94;0;31;0
WireConnection;94;1;100;0
WireConnection;94;2;97;0
WireConnection;1007;0;367;0
WireConnection;1007;1;1010;0
WireConnection;1007;2;1006;0
WireConnection;1013;0;471;0
WireConnection;1013;1;1012;0
WireConnection;1013;2;1011;0
WireConnection;984;0;22;0
WireConnection;984;1;973;0
WireConnection;984;2;987;0
WireConnection;368;0;359;1
WireConnection;368;1;359;2
WireConnection;369;0;362;0
WireConnection;369;1;363;0
WireConnection;369;2;366;0
WireConnection;370;0;364;1
WireConnection;370;1;364;2
WireConnection;472;0;463;1
WireConnection;472;1;463;2
WireConnection;473;0;466;0
WireConnection;473;1;467;0
WireConnection;473;2;469;0
WireConnection;474;0;470;1
WireConnection;474;1;470;2
WireConnection;696;0;538;0
WireConnection;537;5;692;0
WireConnection;1009;0;367;0
WireConnection;1009;1;1007;0
WireConnection;1009;2;1008;0
WireConnection;1015;0;471;0
WireConnection;1015;1;1013;0
WireConnection;1015;2;1014;0
WireConnection;91;51;984;0
WireConnection;91;43;30;0
WireConnection;91;44;94;0
WireConnection;91;45;32;0
WireConnection;91;46;36;0
WireConnection;91;47;38;0
WireConnection;91;48;37;3
WireConnection;91;49;37;4
WireConnection;91;50;40;0
WireConnection;91;60;41;0
WireConnection;91;61;43;0
WireConnection;91;73;92;0
WireConnection;91;71;87;0
WireConnection;543;5;693;0
WireConnection;381;51;1009;0
WireConnection;381;43;368;0
WireConnection;381;44;369;0
WireConnection;381;45;372;0
WireConnection;381;46;371;0
WireConnection;381;47;370;0
WireConnection;381;48;364;3
WireConnection;381;49;364;4
WireConnection;381;50;377;0
WireConnection;381;60;373;0
WireConnection;381;61;374;0
WireConnection;381;73;375;0
WireConnection;381;71;376;0
WireConnection;482;51;1015;0
WireConnection;482;43;472;0
WireConnection;482;44;473;0
WireConnection;482;45;476;0
WireConnection;482;46;475;0
WireConnection;482;47;474;0
WireConnection;482;48;470;3
WireConnection;482;49;470;4
WireConnection;482;50;477;0
WireConnection;482;60;478;0
WireConnection;482;61;479;0
WireConnection;482;73;480;0
WireConnection;482;71;481;0
WireConnection;541;0;385;0
WireConnection;541;1;537;0
WireConnection;855;0;91;0
WireConnection;114;0;112;0
WireConnection;542;0;389;0
WireConnection;542;1;543;0
WireConnection;553;5;695;0
WireConnection;659;0;381;0
WireConnection;670;0;484;0
WireConnection;675;0;483;0
WireConnection;686;0;417;0
WireConnection;652;0;413;0
WireConnection;681;0;567;0
WireConnection;859;0;858;0
WireConnection;535;0;385;0
WireConnection;535;1;541;0
WireConnection;535;2;697;0
WireConnection;118;0;114;0
WireConnection;119;0;115;0
WireConnection;119;1;116;0
WireConnection;119;2;112;0
WireConnection;117;0;113;1
WireConnection;117;1;113;2
WireConnection;544;0;389;0
WireConnection;544;1;542;0
WireConnection;544;2;698;0
WireConnection;920;0;772;0
WireConnection;920;1;777;0
WireConnection;201;0;198;0
WireConnection;552;0;392;0
WireConnection;552;1;553;0
WireConnection;647;0;453;0
WireConnection;665;0;482;0
WireConnection;854;0;856;0
WireConnection;854;1;857;0
WireConnection;854;2;859;0
WireConnection;854;3;860;0
WireConnection;996;0;535;0
WireConnection;996;1;997;0
WireConnection;124;5;121;0
WireConnection;123;5;122;0
WireConnection;120;0;119;0
WireConnection;120;1;117;0
WireConnection;120;2;118;0
WireConnection;998;0;544;0
WireConnection;998;1;999;0
WireConnection;921;0;920;0
WireConnection;209;0;202;0
WireConnection;209;1;203;0
WireConnection;209;2;198;0
WireConnection;210;0;204;1
WireConnection;210;1;204;2
WireConnection;554;0;392;0
WireConnection;554;1;552;0
WireConnection;554;2;700;0
WireConnection;208;0;201;0
WireConnection;565;8;648;0
WireConnection;565;34;676;0
WireConnection;565;24;660;0
WireConnection;565;49;666;0
WireConnection;565;11;687;0
WireConnection;565;12;996;0
WireConnection;565;32;653;0
WireConnection;565;48;671;0
WireConnection;565;65;682;0
WireConnection;862;0;854;0
WireConnection;127;0;125;3
WireConnection;127;1;125;4
WireConnection;128;0;123;0
WireConnection;128;1;124;0
WireConnection;976;0;120;0
WireConnection;976;1;975;0
WireConnection;976;2;977;0
WireConnection;922;0;921;0
WireConnection;205;5;200;0
WireConnection;206;5;199;0
WireConnection;1002;0;554;0
WireConnection;1002;1;1003;0
WireConnection;215;0;209;0
WireConnection;215;1;210;0
WireConnection;215;2;208;0
WireConnection;563;8;649;0
WireConnection;563;34;678;0
WireConnection;563;24;662;0
WireConnection;563;49;667;0
WireConnection;563;11;688;0
WireConnection;563;12;998;0
WireConnection;563;32;655;0
WireConnection;563;48;672;0
WireConnection;563;65;683;0
WireConnection;393;0;565;0
WireConnection;134;0;125;1
WireConnection;134;1;125;2
WireConnection;135;0;127;0
WireConnection;135;1;128;0
WireConnection;135;2;129;0
WireConnection;130;0;126;1
WireConnection;130;1;126;2
WireConnection;395;0;563;0
WireConnection;988;0;120;0
WireConnection;988;1;976;0
WireConnection;988;2;989;0
WireConnection;923;0;922;0
WireConnection;211;0;207;3
WireConnection;211;1;207;4
WireConnection;212;0;206;0
WireConnection;212;1;205;0
WireConnection;562;8;651;0
WireConnection;562;34;680;0
WireConnection;562;24;664;0
WireConnection;562;49;669;0
WireConnection;562;11;690;0
WireConnection;562;12;1002;0
WireConnection;562;32;657;0
WireConnection;562;48;674;0
WireConnection;562;65;685;0
WireConnection;982;0;215;0
WireConnection;982;1;981;0
WireConnection;982;2;983;0
WireConnection;871;0;91;0
WireConnection;871;1;872;0
WireConnection;871;2;873;0
WireConnection;111;51;988;0
WireConnection;111;43;134;0
WireConnection;111;44;135;0
WireConnection;111;45;139;0
WireConnection;111;46;138;0
WireConnection;111;47;130;0
WireConnection;111;48;126;3
WireConnection;111;49;126;4
WireConnection;111;50;137;0
WireConnection;111;60;133;0
WireConnection;111;61;132;0
WireConnection;111;73;136;0
WireConnection;111;71;131;0
WireConnection;779;0;923;0
WireConnection;779;1;922;0
WireConnection;779;2;784;0
WireConnection;216;0;207;1
WireConnection;216;1;207;2
WireConnection;217;0;211;0
WireConnection;217;1;212;0
WireConnection;217;2;213;0
WireConnection;218;0;214;1
WireConnection;218;1;214;2
WireConnection;992;0;215;0
WireConnection;992;1;982;0
WireConnection;992;2;993;0
WireConnection;548;5;694;0
WireConnection;396;0;562;0
WireConnection;1142;5;1139;0
WireConnection;1146;0;1138;0
WireConnection;1143;5;1140;0
WireConnection;397;0;871;0
WireConnection;397;1;398;0
WireConnection;399;0;111;0
WireConnection;399;1;400;0
WireConnection;924;0;779;0
WireConnection;924;1;782;0
WireConnection;226;51;992;0
WireConnection;226;43;216;0
WireConnection;226;44;217;0
WireConnection;226;45;220;0
WireConnection;226;46;219;0
WireConnection;226;47;218;0
WireConnection;226;48;214;3
WireConnection;226;49;214;4
WireConnection;226;50;221;0
WireConnection;226;60;222;0
WireConnection;226;61;223;0
WireConnection;226;73;224;0
WireConnection;226;71;225;0
WireConnection;166;0;165;0
WireConnection;547;0;387;0
WireConnection;547;1;548;0
WireConnection;1148;0;1144;0
WireConnection;1148;1;1141;0
WireConnection;1148;2;1138;0
WireConnection;1149;0;1147;3
WireConnection;1149;1;1147;4
WireConnection;1150;0;1143;0
WireConnection;1150;1;1142;0
WireConnection;1151;0;1146;0
WireConnection;1152;0;1145;1
WireConnection;1152;1;1145;2
WireConnection;1180;5;1177;0
WireConnection;17;0;1047;0
WireConnection;17;1;397;0
WireConnection;109;1;399;0
WireConnection;925;0;924;0
WireConnection;925;1;781;0
WireConnection;403;0;226;0
WireConnection;403;1;404;0
WireConnection;994;0;215;0
WireConnection;994;1;982;0
WireConnection;994;2;995;0
WireConnection;174;0;166;0
WireConnection;175;0;167;0
WireConnection;175;1;168;0
WireConnection;175;2;165;0
WireConnection;176;0;169;1
WireConnection;176;1;169;2
WireConnection;549;0;387;0
WireConnection;549;1;547;0
WireConnection;549;2;699;0
WireConnection;1155;0;1148;0
WireConnection;1155;1;1152;0
WireConnection;1155;2;1151;0
WireConnection;1156;0;1147;1
WireConnection;1156;1;1147;2
WireConnection;1157;0;1149;0
WireConnection;1157;1;1150;0
WireConnection;1157;2;1154;0
WireConnection;1158;0;1153;1
WireConnection;1158;1;1153;2
WireConnection;1176;0;1167;0
WireConnection;1176;1;1180;0
WireConnection;1176;2;1179;0
WireConnection;44;78;17;4
WireConnection;44;75;17;1
WireConnection;44;76;17;2
WireConnection;44;77;17;3
WireConnection;44;79;45;0
WireConnection;140;78;109;4
WireConnection;140;75;109;1
WireConnection;140;76;109;2
WireConnection;140;77;109;3
WireConnection;140;79;141;0
WireConnection;775;0;925;0
WireConnection;244;51;994;0
WireConnection;244;46;249;0
WireConnection;244;50;257;0
WireConnection;227;1;403;0
WireConnection;171;5;163;0
WireConnection;172;5;164;0
WireConnection;187;0;175;0
WireConnection;187;1;176;0
WireConnection;187;2;174;0
WireConnection;1000;0;549;0
WireConnection;1000;1;1001;0
WireConnection;315;5;314;0
WireConnection;890;1;891;0
WireConnection;890;0;893;0
WireConnection;1165;51;1155;0
WireConnection;1165;43;1156;0
WireConnection;1165;44;1157;0
WireConnection;1165;45;1163;0
WireConnection;1165;46;1159;0
WireConnection;1165;47;1158;0
WireConnection;1165;48;1153;3
WireConnection;1165;49;1153;4
WireConnection;1165;50;1164;0
WireConnection;1165;60;1160;0
WireConnection;1165;61;1161;0
WireConnection;1168;0;1176;0
WireConnection;76;0;77;0
WireConnection;76;1;75;0
WireConnection;155;0;44;0
WireConnection;155;1;140;0
WireConnection;153;0;44;0
WireConnection;153;1;140;0
WireConnection;254;1;244;0
WireConnection;229;78;227;4
WireConnection;229;75;227;1
WireConnection;229;76;227;2
WireConnection;229;77;227;3
WireConnection;229;79;228;0
WireConnection;889;0;890;0
WireConnection;884;2;885;0
WireConnection;884;0;894;0
WireConnection;884;1;895;0
WireConnection;794;0;775;0
WireConnection;177;0;170;3
WireConnection;177;1;170;4
WireConnection;178;0;172;0
WireConnection;178;1;171;0
WireConnection;564;8;650;0
WireConnection;564;34;679;0
WireConnection;564;24;663;0
WireConnection;564;49;668;0
WireConnection;564;11;689;0
WireConnection;564;12;1000;0
WireConnection;564;32;656;0
WireConnection;564;48;673;0
WireConnection;564;65;684;0
WireConnection;979;0;187;0
WireConnection;979;1;978;0
WireConnection;979;2;980;0
WireConnection;313;0;272;0
WireConnection;313;1;315;0
WireConnection;313;2;316;0
WireConnection;1210;0;1208;4
WireConnection;1166;1;1165;0
WireConnection;1166;5;1168;0
WireConnection;78;0;397;0
WireConnection;78;1;76;0
WireConnection;74;0;397;0
WireConnection;74;1;76;0
WireConnection;1041;0;1039;0
WireConnection;1042;0;1040;0
WireConnection;152;78;44;0
WireConnection;152;75;140;0
WireConnection;152;76;153;0
WireConnection;152;77;155;0
WireConnection;152;79;156;0
WireConnection;886;0;884;0
WireConnection;888;0;890;0
WireConnection;888;1;889;0
WireConnection;888;2;896;0
WireConnection;188;0;170;1
WireConnection;188;1;170;2
WireConnection;189;0;177;0
WireConnection;189;1;178;0
WireConnection;189;2;179;0
WireConnection;190;0;173;1
WireConnection;190;1;173;2
WireConnection;394;0;564;0
WireConnection;990;0;187;0
WireConnection;990;1;979;0
WireConnection;990;2;991;0
WireConnection;263;0;229;0
WireConnection;263;1;254;1
WireConnection;263;2;264;0
WireConnection;1207;0;313;0
WireConnection;1207;1;1210;0
WireConnection;1207;2;1209;0
WireConnection;1169;0;1166;0
WireConnection;71;0;1047;0
WireConnection;71;1;74;0
WireConnection;73;0;1047;0
WireConnection;73;1;78;0
WireConnection;887;0;886;0
WireConnection;887;1;888;0
WireConnection;838;0;152;0
WireConnection;838;1;803;0
WireConnection;191;51;990;0
WireConnection;191;43;188;0
WireConnection;191;44;189;0
WireConnection;191;45;186;0
WireConnection;191;46;185;0
WireConnection;191;47;190;0
WireConnection;191;48;173;3
WireConnection;191;49;173;4
WireConnection;191;50;180;0
WireConnection;191;60;181;0
WireConnection;191;61;182;0
WireConnection;191;73;183;0
WireConnection;191;71;184;0
WireConnection;312;5;311;0
WireConnection;269;0;271;0
WireConnection;269;1;1207;0
WireConnection;265;0;263;0
WireConnection;265;1;266;0
WireConnection;72;0;71;1
WireConnection;72;1;17;2
WireConnection;72;2;73;3
WireConnection;1052;28;1047;0
WireConnection;1052;29;1053;0
WireConnection;1052;27;1051;0
WireConnection;1052;25;1046;0
WireConnection;1052;26;1045;0
WireConnection;898;0;896;0
WireConnection;840;0;838;0
WireConnection;825;0;152;0
WireConnection;825;1;803;0
WireConnection;401;0;191;0
WireConnection;401;1;402;0
WireConnection;897;0;887;0
WireConnection;267;0;265;0
WireConnection;267;1;269;0
WireConnection;309;0;275;0
WireConnection;309;1;312;0
WireConnection;309;2;310;0
WireConnection;937;0;1173;0
WireConnection;1049;0;72;0
WireConnection;1049;1;1052;0
WireConnection;1049;2;1050;0
WireConnection;192;1;401;0
WireConnection;827;0;825;0
WireConnection;827;1;840;0
WireConnection;827;2;810;0
WireConnection;274;0;267;0
WireConnection;276;0;309;0
WireConnection;943;0;937;0
WireConnection;1227;0;1226;0
WireConnection;79;0;1049;0
WireConnection;79;1;80;0
WireConnection;829;0;152;0
WireConnection;829;1;827;0
WireConnection;829;2;812;0
WireConnection;194;78;192;4
WireConnection;194;75;192;1
WireConnection;194;76;192;2
WireConnection;194;77;192;3
WireConnection;194;79;193;0
WireConnection;912;0;911;0
WireConnection;912;2;913;0
WireConnection;273;0;274;0
WireConnection;273;1;309;0
WireConnection;273;2;276;0
WireConnection;1222;0;1221;0
WireConnection;1222;1;1212;4
WireConnection;1222;2;1223;0
WireConnection;939;0;938;0
WireConnection;939;1;943;0
WireConnection;1228;0;1227;0
WireConnection;47;0;79;0
WireConnection;47;1;48;0
WireConnection;196;0;829;0
WireConnection;196;1;194;0
WireConnection;196;2;273;0
WireConnection;196;3;912;0
WireConnection;196;4;1098;0
WireConnection;196;5;1222;0
WireConnection;940;0;939;0
WireConnection;940;1;946;0
WireConnection;1230;0;1229;0
WireConnection;1230;1;1228;0
WireConnection;59;0;47;0
WireConnection;1065;0;196;0
WireConnection;960;0;957;0
WireConnection;1225;0;1230;0
WireConnection;1225;1;1224;0
WireConnection;929;0;940;0
WireConnection;929;1;948;0
WireConnection;49;0;59;0
WireConnection;49;1;50;0
WireConnection;1064;0;1065;0
WireConnection;941;0;929;0
WireConnection;955;0;954;5
WireConnection;955;1;960;0
WireConnection;1231;0;1225;0
WireConnection;1231;1;1232;0
WireConnection;51;0;49;0
WireConnection;51;1;79;0
WireConnection;51;2;52;0
WireConnection;1215;0;1218;0
WireConnection;933;0;955;0
WireConnection;933;1;954;5
WireConnection;933;2;941;0
WireConnection;1233;0;1231;0
WireConnection;877;0;51;0
WireConnection;877;1;879;5
WireConnection;751;0;1174;0
WireConnection;1213;0;1068;0
WireConnection;1213;2;1215;0
WireConnection;1234;0;1233;0
WireConnection;1234;1;1236;5
WireConnection;1234;2;1237;1
WireConnection;1234;3;1241;0
WireConnection;934;0;942;1
WireConnection;934;1;933;0
WireConnection;875;0;876;5
WireConnection;875;1;877;0
WireConnection;875;2;44;0
WireConnection;749;0;750;0
WireConnection;749;1;751;0
WireConnection;1202;0;1184;0
WireConnection;1066;1;1213;0
WireConnection;1239;0;934;0
WireConnection;1239;1;1234;0
WireConnection;882;0;51;0
WireConnection;882;1;875;0
WireConnection;882;2;873;0
WireConnection;747;0;749;0
WireConnection;319;0;318;0
WireConnection;1069;0;1066;5
WireConnection;1085;0;1086;0
WireConnection;1085;1;1239;0
WireConnection;1085;2;1088;0
WireConnection;159;39;109;5
WireConnection;159;40;882;0
WireConnection;159;43;145;0
WireConnection;159;44;146;0
WireConnection;748;0;747;0
WireConnection;317;0;1207;0
WireConnection;317;1;319;0
WireConnection;317;2;1203;0
WireConnection;962;0;1085;0
WireConnection;703;5;713;0
WireConnection;495;5;493;0
WireConnection;496;5;492;0
WireConnection;499;0;491;0
WireConnection;746;0;748;0
WireConnection;757;0;1175;0
WireConnection;758;0;760;0
WireConnection;1071;0;159;0
WireConnection;1071;1;1072;0
WireConnection;1071;2;1073;0
WireConnection;572;5;569;0
WireConnection;573;5;570;0
WireConnection;576;0;568;0
WireConnection;325;0;323;0
WireConnection;325;1;317;0
WireConnection;704;0;716;0
WireConnection;704;1;703;0
WireConnection;501;0;497;0
WireConnection;501;1;494;0
WireConnection;501;2;491;0
WireConnection;502;0;500;3
WireConnection;502;1;500;4
WireConnection;503;0;496;0
WireConnection;503;1;495;0
WireConnection;505;0;498;1
WireConnection;505;1;498;2
WireConnection;504;0;499;0
WireConnection;759;0;758;0
WireConnection;759;1;757;0
WireConnection;899;1;887;0
WireConnection;899;2;900;0
WireConnection;963;0;964;0
WireConnection;963;1;1071;0
WireConnection;578;0;574;0
WireConnection;578;1;571;0
WireConnection;578;2;568;0
WireConnection;579;0;577;3
WireConnection;579;1;577;4
WireConnection;580;0;573;0
WireConnection;580;1;572;0
WireConnection;581;0;576;0
WireConnection;582;0;575;1
WireConnection;582;1;575;2
WireConnection;752;1;746;0
WireConnection;326;0;265;0
WireConnection;326;1;325;0
WireConnection;1220;0;1221;0
WireConnection;1220;1;1212;0
WireConnection;1220;2;1223;0
WireConnection;705;0;716;0
WireConnection;705;1;704;0
WireConnection;705;2;714;0
WireConnection;508;0;501;0
WireConnection;508;1;505;0
WireConnection;508;2;504;0
WireConnection;509;0;500;1
WireConnection;509;1;500;2
WireConnection;510;0;502;0
WireConnection;510;1;503;0
WireConnection;510;2;506;0
WireConnection;511;0;507;1
WireConnection;511;1;507;2
WireConnection;753;0;752;0
WireConnection;753;1;754;0
WireConnection;905;0;899;0
WireConnection;905;1;906;0
WireConnection;815;0;842;5
WireConnection;815;1;963;0
WireConnection;815;2;1220;0
WireConnection;585;0;578;0
WireConnection;585;1;582;0
WireConnection;585;2;581;0
WireConnection;586;0;577;1
WireConnection;586;1;577;2
WireConnection;587;0;579;0
WireConnection;587;1;580;0
WireConnection;587;2;584;0
WireConnection;590;0;583;1
WireConnection;590;1;583;2
WireConnection;761;1;759;0
WireConnection;327;0;326;0
WireConnection;519;51;508;0
WireConnection;519;43;509;0
WireConnection;519;44;510;0
WireConnection;519;45;512;0
WireConnection;519;46;513;0
WireConnection;519;47;511;0
WireConnection;519;48;507;3
WireConnection;519;49;507;4
WireConnection;519;50;518;0
WireConnection;519;60;517;0
WireConnection;519;61;516;0
WireConnection;519;73;515;0
WireConnection;519;71;514;0
WireConnection;762;0;761;0
WireConnection;762;1;763;0
WireConnection;755;0;753;0
WireConnection;755;1;756;0
WireConnection;907;0;908;0
WireConnection;907;1;905;0
WireConnection;907;2;914;5
WireConnection;847;0;815;0
WireConnection;847;1;806;5
WireConnection;847;2;799;0
WireConnection;702;8;708;0
WireConnection;702;34;709;0
WireConnection;702;24;715;0
WireConnection;702;49;706;0
WireConnection;702;11;712;0
WireConnection;702;12;705;0
WireConnection;702;32;707;0
WireConnection;702;48;710;0
WireConnection;702;65;711;0
WireConnection;596;51;585;0
WireConnection;596;43;586;0
WireConnection;596;44;587;0
WireConnection;596;45;589;0
WireConnection;596;46;588;0
WireConnection;596;47;590;0
WireConnection;596;48;583;3
WireConnection;596;49;583;4
WireConnection;596;50;595;0
WireConnection;596;60;594;0
WireConnection;596;61;593;0
WireConnection;596;73;592;0
WireConnection;596;71;591;0
WireConnection;328;0;327;0
WireConnection;328;1;309;0
WireConnection;328;2;276;0
WireConnection;523;1;519;0
WireConnection;764;0;755;0
WireConnection;764;1;762;0
WireConnection;902;0;907;0
WireConnection;851;0;815;0
WireConnection;851;1;847;0
WireConnection;851;2;810;0
WireConnection;1104;0;702;0
WireConnection;1104;1;1171;0
WireConnection;1104;2;1106;0
WireConnection;599;1;596;0
WireConnection;329;0;273;0
WireConnection;329;1;328;0
WireConnection;524;78;523;4
WireConnection;524;75;523;1
WireConnection;524;76;523;2
WireConnection;524;77;523;3
WireConnection;524;79;521;0
WireConnection;720;0;719;0
WireConnection;720;1;1104;0
WireConnection;766;0;767;0
WireConnection;766;1;764;0
WireConnection;766;2;768;0
WireConnection;850;0;815;0
WireConnection;850;1;851;0
WireConnection;850;2;812;0
WireConnection;330;0;329;0
WireConnection;1070;0;1066;4
WireConnection;598;78;599;4
WireConnection;598;75;599;1
WireConnection;598;76;599;2
WireConnection;598;77;599;3
WireConnection;598;79;597;0
WireConnection;525;0;524;0
WireConnection;525;1;526;1
WireConnection;525;2;526;2
WireConnection;525;3;526;3
WireConnection;525;4;526;4
WireConnection;602;0;598;0
WireConnection;602;1;603;1
WireConnection;602;2;603;2
WireConnection;602;3;603;3
WireConnection;602;4;603;4
WireConnection;731;0;720;0
WireConnection;765;0;766;0
WireConnection;909;0;910;0
WireConnection;909;1;850;0
WireConnection;1089;0;196;0
WireConnection;1089;1;1075;0
WireConnection;1089;2;1076;0
WireConnection;601;0;525;0
WireConnection;601;1;602;0
WireConnection;604;0;525;0
WireConnection;604;1;602;0
WireConnection;560;5;559;0
WireConnection;333;0;909;0
WireConnection;333;1;334;5
WireConnection;333;2;335;0
WireConnection;738;0;731;0
WireConnection;161;0;1089;0
WireConnection;528;0;529;0
WireConnection;528;1;530;0
WireConnection;528;2;531;0
WireConnection;558;1;560;0
WireConnection;558;2;561;0
WireConnection;605;0;601;0
WireConnection;605;1;604;0
WireConnection;605;2;606;0
WireConnection;769;0;770;0
WireConnection;769;1;333;0
WireConnection;1181;0;263;0
WireConnection;1101;0;1089;0
WireConnection;1101;1;161;0
WireConnection;1101;2;1102;0
WireConnection;527;0;605;0
WireConnection;527;1;528;0
WireConnection;527;2;532;0
WireConnection;527;3;558;0
WireConnection;527;4;1219;0
WireConnection;739;0;769;0
WireConnection;739;1;724;0
WireConnection;739;2;740;0
WireConnection;1182;0;1101;0
WireConnection;1182;1;1183;0
WireConnection;1182;2;1184;0
WireConnection;533;0;527;0
WireConnection;1099;0;1100;0
WireConnection;1099;1;739;0
WireConnection;1078;0;775;0
WireConnection;1079;0;1078;0
WireConnection;18;0;1099;0
WireConnection;18;3;1182;0
WireConnection;0;0;18;0
WireConnection;0;1;534;0
ASEEND*/
//CHKSM=C057A7B6A7B60F5549A487E016D6CD4FB0CE3462