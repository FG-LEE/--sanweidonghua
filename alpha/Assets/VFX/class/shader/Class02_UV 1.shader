// Upgrade NOTE: upgraded instancing buffer 'ShaderClass_02UV_Noise' to new syntax.

// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Shader/Class_02UV_Noise"
{
	Properties
	{
		[Enum(MainTex,0)]_MainTex_Select("--------------------------------------MainTex--------------------------------------------", Float) = 0
		[HDR]_Main_Color("Main_Color", Color) = (1,1,1,1)
		_Main_Tex("Main_Tex", 2D) = "white" {}
		_Noise_Tex("Noise_Tex", 2D) = "white" {}
		_Noise_Value("Noise_Value", Float) = 0
		_MainTex_UV("MainTex_UV", Vector) = (0,0,0,0)
		_Mask("Mask", 2D) = "white" {}
		_Main_Str("Main_Str", Float) = 1
		[Toggle(_MASK_CUSTOMORVALUE_U_ON)] _Mask_CustomOrValue_U("Mask_CustomOrValue_U", Float) = 0
		[Toggle(_MASK_CUSTOMORVALUE_V_ON)] _Mask_CustomOrValue_V("Mask_CustomOrValue_V", Float) = 0
		[Toggle(_TEXALPHA_ON)] _TexAlpha("TexAlpha", Float) = 0
		[Enum(Dissolve,0)]_Dissolve("--------------------------------------Dissolve--------------------------------------------", Float) = 0
		[Toggle(_DISSOLVE_CUSTOM_ON)] _Dissolve_Custom("Dissolve_Custom", Float) = 0
		_Dissolve_Noise("Dissolve_Noise", Float) = 0
		[Toggle(_TEXORVORONOI_ON)] _TexOrVoronoi("TexOrVoronoi", Float) = 0
		_Dissolve_Tex("Dissolve_Tex", 2D) = "white" {}
		_Dissolve_U("Dissolve_U", Float) = 0
		_Dissolve_V("Dissolve_V", Float) = 0
		_Voronoi_Angle("Voronoi_Angle", Float) = 1
		_Voronoi_Scale("Voronoi_Scale", Float) = 1
		[HDR]_Dissolve_Color("Dissolve_Color", Color) = (1,1,1,1)
		_LightLine_Width("LightLine_Width", Float) = 0
		_Dissolve_Value("Dissolve_Value", Range( 0 , 1)) = 0
		_HardorSoft("Hard or Soft", Range( 0 , 1)) = 0
		_Dissolve_Str("Dissolve_Str", Float) = 0
		[Enum(custom,0)]_Custom("--------------------------------------Custom--------------------------------------------", Float) = 0
		_Depth("Depth", Float) = 0
		[Enum(UnityEngine.Rendering.CullMode)]_CullMode("Cull Mode", Float) = 0
		[Enum(On,1,Off,0)]_ZWriteMode("ZWrite Mode", Float) = 0
		[Enum(UnityEngine.Rendering.CompareFunction)]_ZTestMode("ZTest Mode", Float) = 4
		[Enum(UnityEngine.Rendering.BlendMode)]_Src("Src", Float) = 5
		[Enum(UnityEngine.Rendering.BlendMode)]_Dst("Dst", Float) = 1
		_Offset_U("Offset_U", Float) = 0
		_Offset_V("Offset_V", Float) = 0
		[Toggle(_OFFSETSWITCH_ON)] _OffsetSwitch("OffsetSwitch", Float) = 0
		_Voronoi("Voronoi", Vector) = (1,1,0,0)
		_Vertex_Offset("Vertex_Offset", Vector) = (0,0,0,0)
		_fresnel("fresnel", Vector) = (0,0,0,0)
		[Toggle(_FRESNEL_MASK_ON)] _Fresnel_Mask("Fresnel_Mask", Float) = 0
		[Toggle(_ONEMINUS_ON)] _OneMinus("OneMinus", Float) = 0

	}
	
	SubShader
	{
		
		
		Tags { "RenderType"="Transparent" }
	LOD 100

		CGINCLUDE
		#pragma target 3.0
		ENDCG
		Blend [_Src] [_Dst]
		AlphaToMask Off
		Cull [_CullMode]
		ColorMask RGBA
		ZWrite [_ZWriteMode]
		ZTest [_ZTestMode]
		
		
		
		Pass
		{
			Name "Unlit"
			Tags { "LightMode"="ForwardBase" }
			CGPROGRAM

			

			#ifndef UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX
			//only defining to not throw compilation error over Unity 5.5
			#define UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input)
			#endif
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_instancing
			#include "UnityCG.cginc"
			#include "UnityShaderVariables.cginc"
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#pragma shader_feature _OFFSETSWITCH_ON
			#pragma shader_feature _TEXORVORONOI_ON
			#pragma shader_feature _DISSOLVE_CUSTOM_ON
			#pragma shader_feature _MASK_CUSTOMORVALUE_U_ON
			#pragma shader_feature _MASK_CUSTOMORVALUE_V_ON
			#pragma shader_feature_local _FRESNEL_MASK_ON
			#pragma shader_feature_local _ONEMINUS_ON
			#pragma shader_feature _TEXALPHA_ON


			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				float3 ase_normal : NORMAL;
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
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			uniform float _CullMode;
			uniform float _ZTestMode;
			uniform float _Src;
			uniform float _Custom;
			uniform float _MainTex_Select;
			uniform float _Dst;
			uniform float _ZWriteMode;
			uniform float _Dissolve;
			uniform float4 _Voronoi;
			uniform float _Offset_U;
			uniform float _Offset_V;
			uniform float3 _Vertex_Offset;
			uniform float _HardorSoft;
			uniform sampler2D _Dissolve_Tex;
			uniform float _Dissolve_U;
			uniform float _Dissolve_V;
			uniform sampler2D _Noise_Tex;
			uniform float4 _MainTex_UV;
			uniform float _Noise_Value;
			uniform float _Dissolve_Noise;
			uniform float _Voronoi_Scale;
			uniform float _Voronoi_Angle;
			uniform float _Dissolve_Value;
			uniform float _LightLine_Width;
			uniform float4 _Dissolve_Color;
			uniform float _Dissolve_Str;
			uniform sampler2D _Main_Tex;
			uniform float _Main_Str;
			UNITY_DECLARE_DEPTH_TEXTURE( _CameraDepthTexture );
			uniform float4 _CameraDepthTexture_TexelSize;
			uniform float _Depth;
			uniform sampler2D _Mask;
			uniform float4 _fresnel;
			UNITY_INSTANCING_BUFFER_START(ShaderClass_02UV_Noise)
				UNITY_DEFINE_INSTANCED_PROP(float4, _Dissolve_Tex_ST)
#define _Dissolve_Tex_ST_arr ShaderClass_02UV_Noise
				UNITY_DEFINE_INSTANCED_PROP(float4, _Noise_Tex_ST)
#define _Noise_Tex_ST_arr ShaderClass_02UV_Noise
				UNITY_DEFINE_INSTANCED_PROP(float4, _Main_Tex_ST)
#define _Main_Tex_ST_arr ShaderClass_02UV_Noise
				UNITY_DEFINE_INSTANCED_PROP(float4, _Main_Color)
#define _Main_Color_arr ShaderClass_02UV_Noise
				UNITY_DEFINE_INSTANCED_PROP(float4, _Mask_ST)
#define _Mask_ST_arr ShaderClass_02UV_Noise
			UNITY_INSTANCING_BUFFER_END(ShaderClass_02UV_Noise)
					float2 voronoihash372( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi372( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash372( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.707 * sqrt(dot( r, r ));
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return F2;
					}
			
					float2 voronoihash295( float2 p )
					{
						p = p - 10 * floor( p / 10 );
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi295( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -3; j <= 3; j++ )
						{
							for ( int i = -3; i <= 3; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash295( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return F1;
					}
			

			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				float3 temp_cast_0 = (0.0).xxx;
				float time372 = _Voronoi.z;
				float2 voronoiSmoothId0 = 0;
				float2 texCoord378 = v.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult376 = (float2(_Voronoi.x , _Voronoi.y));
				float2 appendResult362 = (float2(_Offset_U , _Offset_V));
				float2 texCoord359 = v.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float2 panner357 = ( 1.0 * _Time.y * appendResult362 + texCoord359);
				float2 coords372 = ( texCoord378 + appendResult376 + panner357 ) * _Voronoi.w;
				float2 id372 = 0;
				float2 uv372 = 0;
				float voroi372 = voronoi372( coords372, time372, id372, uv372, 0, voronoiSmoothId0 );
				#ifdef _OFFSETSWITCH_ON
				float3 staticSwitch369 = ( voroi372 * _Vertex_Offset * v.vertex.xyz );
				#else
				float3 staticSwitch369 = temp_cast_0;
				#endif
				float3 VertexOffset396 = staticSwitch369;
				
				float4 ase_clipPos = UnityObjectToClipPos(v.vertex);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord3 = screenPos;
				float3 ase_worldNormal = UnityObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord4.xyz = ase_worldNormal;
				
				o.ase_texcoord1.xy = v.ase_texcoord.xy;
				o.ase_texcoord2 = v.ase_texcoord1;
				o.ase_color = v.color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.zw = 0;
				o.ase_texcoord4.w = 0;
				float3 vertexValue = float3(0, 0, 0);
				#if ASE_ABSOLUTE_VERTEX_POS
				vertexValue = v.vertex.xyz;
				#endif
				vertexValue = VertexOffset396;
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
				float HardorSoft317 = _HardorSoft;
				float temp_output_144_0 = ( 1.0 - HardorSoft317 );
				float4 _Dissolve_Tex_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_Dissolve_Tex_ST_arr, _Dissolve_Tex_ST);
				float2 uv_Dissolve_Tex = i.ase_texcoord1.xy * _Dissolve_Tex_ST_Instance.xy + _Dissolve_Tex_ST_Instance.zw;
				float2 appendResult344 = (float2(_Dissolve_U , _Dissolve_V));
				float2 appendResult75 = (float2(_MainTex_UV.z , _MainTex_UV.w));
				float4 _Noise_Tex_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_Noise_Tex_ST_arr, _Noise_Tex_ST);
				float2 uv_Noise_Tex = i.ase_texcoord1.xy * _Noise_Tex_ST_Instance.xy + _Noise_Tex_ST_Instance.zw;
				float4 tex2DNode33 = tex2D( _Noise_Tex, ( ( _Time.y * appendResult75 ) + uv_Noise_Tex ) );
				float3 desaturateInitialColor340 = tex2DNode33.rgb;
				float desaturateDot340 = dot( desaturateInitialColor340, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar340 = lerp( desaturateInitialColor340, desaturateDot340.xxx, 1.0 );
				float3 temp_output_404_0 = ( desaturateVar340 * _Noise_Value );
				float3 temp_output_347_0 = ( float3( uv_Dissolve_Tex ,  0.0 ) + float3( ( appendResult344 * _Time.y ) ,  0.0 ) + ( temp_output_404_0 * _Dissolve_Noise ) );
				float time295 = _Voronoi_Angle;
				float2 voronoiSmoothId0 = 0;
				float2 coords295 = temp_output_347_0.xy * _Voronoi_Scale;
				float2 id295 = 0;
				float2 uv295 = 0;
				float fade295 = 0.5;
				float voroi295 = 0;
				float rest295 = 0;
				for( int it295 = 0; it295 <3; it295++ ){
				voroi295 += fade295 * voronoi295( coords295, time295, id295, uv295, 0,voronoiSmoothId0 );
				rest295 += fade295;
				coords295 *= 2;
				fade295 *= 0.5;
				}//Voronoi295
				voroi295 /= rest295;
				#ifdef _TEXORVORONOI_ON
				float staticSwitch306 = voroi295;
				#else
				float staticSwitch306 = tex2D( _Dissolve_Tex, temp_output_347_0.xy ).r;
				#endif
				float4 texCoord180 = i.ase_texcoord2;
				texCoord180.xy = i.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _DISSOLVE_CUSTOM_ON
				float staticSwitch194 = texCoord180.x;
				#else
				float staticSwitch194 = _Dissolve_Value;
				#endif
				float smoothstepResult145 = smoothstep( temp_output_144_0 , 1.0 , ( ( staticSwitch306 + 1.0 ) - (0.0 + (staticSwitch194 - 0.0) * (( staticSwitch194 + HardorSoft317 ) - 0.0) / (1.0 - 0.0)) ));
				float3 temp_cast_7 = (smoothstepResult145).xxx;
				float3 desaturateInitialColor246 = temp_cast_7;
				float desaturateDot246 = dot( desaturateInitialColor246, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar246 = lerp( desaturateInitialColor246, desaturateDot246.xxx, 1.0 );
				float temp_output_288_0 = ( staticSwitch194 * ( abs( _LightLine_Width ) + 1.0 ) );
				float smoothstepResult227 = smoothstep( temp_output_144_0 , 1.0 , ( ( staticSwitch306 + 1.0 ) - (0.0 + (temp_output_288_0 - 0.0) * (( temp_output_288_0 + HardorSoft317 ) - 0.0) / (1.0 - 0.0)) ));
				float3 temp_cast_8 = (smoothstepResult227).xxx;
				float3 desaturateInitialColor247 = temp_cast_8;
				float desaturateDot247 = dot( desaturateInitialColor247, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar247 = lerp( desaturateInitialColor247, desaturateDot247.xxx, 1.0 );
				float3 temp_output_279_0 = ( desaturateVar246 - desaturateVar247 );
				float4 DissolveLightline310 = ( float4( temp_output_279_0 , 0.0 ) * _Dissolve_Color * _Dissolve_Str );
				float4 _Main_Tex_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_Main_Tex_ST_arr, _Main_Tex_ST);
				float2 uv_Main_Tex = i.ase_texcoord1.xy * _Main_Tex_ST_Instance.xy + _Main_Tex_ST_Instance.zw;
				float2 appendResult5 = (float2(_MainTex_UV.x , _MainTex_UV.y));
				float4 tex2DNode1 = tex2D( _Main_Tex, ( float3( uv_Main_Tex ,  0.0 ) + float3( ( appendResult5 * _Time.y ) ,  0.0 ) + temp_output_404_0 ).xy );
				float4 temp_output_351_0 = ( tex2DNode1 * tex2DNode1.a * i.ase_color.a );
				float4 TexColor167 = ( temp_output_351_0 * tex2DNode33 * tex2DNode33.a );
				float4 _Main_Color_Instance = UNITY_ACCESS_INSTANCED_PROP(_Main_Color_arr, _Main_Color);
				float3 Dissolve314 = ( desaturateVar246 + temp_output_279_0 );
				float4 screenPos = i.ase_texcoord3;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth209 = LinearEyeDepth(SAMPLE_DEPTH_TEXTURE( _CameraDepthTexture, ase_screenPosNorm.xy ));
				float distanceDepth209 = abs( ( screenDepth209 - LinearEyeDepth( ase_screenPosNorm.z ) ) / ( _Depth ) );
				float temp_output_210_0 = saturate( distanceDepth209 );
				float4 _Mask_ST_Instance = UNITY_ACCESS_INSTANCED_PROP(_Mask_ST_arr, _Mask_ST);
				float2 uv_Mask = i.ase_texcoord1.xy * _Mask_ST_Instance.xy + _Mask_ST_Instance.zw;
				float4 texCoord187 = i.ase_texcoord2;
				texCoord187.xy = i.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _MASK_CUSTOMORVALUE_U_ON
				float staticSwitch216 = texCoord187.y;
				#else
				float staticSwitch216 = 0.0;
				#endif
				#ifdef _MASK_CUSTOMORVALUE_V_ON
				float staticSwitch217 = texCoord187.z;
				#else
				float staticSwitch217 = 0.0;
				#endif
				float2 appendResult189 = (float2(staticSwitch216 , staticSwitch217));
				float4 tex2DNode67 = tex2D( _Mask, ( uv_Mask + appendResult189 ) );
				float3 desaturateInitialColor352 = tex2DNode67.rgb;
				float desaturateDot352 = dot( desaturateInitialColor352, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar352 = lerp( desaturateInitialColor352, desaturateDot352.xxx, 1.0 );
				float3 Mask172 = ( desaturateVar352 * tex2DNode67.a );
				float3 ase_worldViewDir = UnityWorldSpaceViewDir(WorldPosition);
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_worldNormal = i.ase_texcoord4.xyz;
				float fresnelNdotV406 = dot( ase_worldNormal, ase_worldViewDir );
				float fresnelNode406 = ( _fresnel.x + _fresnel.y * pow( 1.0 - fresnelNdotV406, _fresnel.z ) );
				#ifdef _ONEMINUS_ON
				float staticSwitch422 = ( 1.0 - fresnelNode406 );
				#else
				float staticSwitch422 = fresnelNode406;
				#endif
				#ifdef _FRESNEL_MASK_ON
				float staticSwitch412 = staticSwitch422;
				#else
				float staticSwitch412 = 1.0;
				#endif
				float4 TexAlpha168 = temp_output_351_0;
				float4 temp_cast_17 = (1.0).xxxx;
				#ifdef _TEXALPHA_ON
				float4 staticSwitch342 = temp_cast_17;
				#else
				float4 staticSwitch342 = TexAlpha168;
				#endif
				float4 appendResult105 = (float4(abs( (( ( ( DissolveLightline310 * TexColor167 ) + ( TexColor167 * _Main_Str * i.ase_color * _Main_Color_Instance * float4( Dissolve314 , 0.0 ) ) ) * temp_output_210_0 * float4( Mask172 , 0.0 ) * staticSwitch412 )).rgb ) , abs( ( temp_output_210_0 * ( _Main_Color_Instance.a * i.ase_color.a * float4( Dissolve314 , 0.0 ) * staticSwitch342 * float4( Mask172 , 0.0 ) * staticSwitch412 ) ) ).r));
				
				
				finalColor = appendResult105;
				return finalColor;
			}
			ENDCG
		}
	}
	CustomEditor "ASEMaterialInspector"
	
	
}
/*ASEBEGIN
Version=18910
-1541;319;1186;891;-1931.281;2506.326;1.311617;True;True
Node;AmplifyShaderEditor.CommentaryNode;322;-1908.344,-3532.793;Inherit;False;2416.574;1281.648;MainTex;32;172;168;98;167;100;352;67;339;99;340;33;351;191;1;60;189;192;76;71;216;8;217;187;9;16;75;15;5;82;402;404;405;MainTex;1,1,1,1;0;0
Node;AmplifyShaderEditor.Vector4Node;82;-1854.779,-3304.525;Float;False;Property;_MainTex_UV;MainTex_UV;5;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0.1,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;75;-1595.082,-3035.088;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleTimeNode;15;-1397.109,-3110.88;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;76;-1431,-2970.062;Inherit;False;0;33;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;71;-1185.748,-3059.297;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT2;-1,-1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;60;-1017.275,-3065.814;Inherit;True;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;323;-3942.072,-1769.549;Inherit;False;4498.865;897.098;Dissolve;44;310;314;283;293;232;280;279;247;246;227;145;155;144;225;320;223;156;224;143;306;153;221;319;288;295;318;305;317;194;347;299;298;290;346;154;151;292;180;301;343;282;344;349;348;Dissolve;1,1,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode;33;-796.1312,-3082.611;Inherit;True;Property;_Noise_Tex;Noise_Tex;3;0;Create;True;0;0;0;False;0;False;-1;None;fa2e0fd7f8120fa4dab48d7b1f09881a;True;1;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;348;-3815.412,-1666.089;Inherit;False;Property;_Dissolve_U;Dissolve_U;16;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;349;-3816.412,-1595.089;Inherit;False;Property;_Dissolve_V;Dissolve_V;17;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;405;-383.2415,-2931.524;Inherit;False;Property;_Noise_Value;Noise_Value;4;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DesaturateOpNode;340;-457.7417,-3066.167;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;282;-3002.531,-1242.471;Inherit;False;Property;_LightLine_Width;LightLine_Width;21;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;343;-3617.304,-1558.965;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;404;-212.1239,-3141.838;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;419;-2670,-1857.79;Inherit;False;Property;_Dissolve_Noise;Dissolve_Noise;13;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;344;-3593.031,-1664.437;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;154;-2423.508,-1020.395;Inherit;False;Property;_HardorSoft;Hard or Soft;23;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;418;-2473,-1883.79;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;346;-3412.052,-1652.522;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.AbsOpNode;292;-2757.479,-1236.772;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;151;-3046.489,-1424.255;Inherit;False;Property;_Dissolve_Value;Dissolve_Value;22;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;301;-3219.669,-1679.37;Inherit;False;0;305;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;180;-3289.107,-1417.511;Inherit;False;1;-1;4;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;298;-2966.533,-1646.4;Inherit;False;Property;_Voronoi_Angle;Voronoi_Angle;18;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;317;-2114.959,-1018.698;Inherit;False;HardorSoft;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;299;-2776.385,-1630.912;Inherit;False;Property;_Voronoi_Scale;Voronoi_Scale;19;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;194;-2762.143,-1423.719;Inherit;False;Property;_Dissolve_Custom;Dissolve_Custom;12;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;False;True;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;290;-2591.065,-1237.837;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;347;-2588.306,-1683.408;Inherit;False;3;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.VoronoiNode;295;-2470.657,-1671.2;Inherit;True;2;0;1;0;3;True;10;False;False;False;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;3;FLOAT;0;FLOAT2;1;FLOAT2;2
Node;AmplifyShaderEditor.GetLocalVarNode;319;-2425.471,-1151.73;Inherit;False;317;HardorSoft;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;305;-2256.282,-1724.637;Inherit;True;Property;_Dissolve_Tex;Dissolve_Tex;15;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;318;-2148.861,-1373.811;Inherit;False;317;HardorSoft;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;288;-2429.073,-1261.796;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;221;-2186.645,-1168.682;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;153;-1922.543,-1389.373;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;306;-1917.343,-1702.34;Inherit;False;Property;_TexOrVoronoi;TexOrVoronoi;14;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;False;True;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;156;-1781.482,-1422.265;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;224;-1546.926,-1287.121;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;223;-2048.393,-1258.96;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;320;-1450.819,-1557.485;Inherit;False;317;HardorSoft;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;143;-1637.938,-1697.757;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;5;-1363.837,-3280.352;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;225;-1398.701,-1284.122;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;144;-1250.988,-1553.321;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;155;-1393.311,-1696.981;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;16;-1198.858,-3279.437;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;187;-1644.626,-2622.196;Inherit;False;1;-1;4;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;9;-1470.725,-3405.701;Inherit;False;0;1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;216;-1291.681,-2576.608;Inherit;False;Property;_Mask_CustomOrValue_U;Mask_CustomOrValue_U;8;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;False;True;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;145;-1062.509,-1698.033;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;217;-1291.681,-2467.609;Inherit;False;Property;_Mask_CustomOrValue_V;Mask_CustomOrValue_V;9;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;False;True;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;227;-1037.732,-1574.384;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;8;-937.4982,-3410.101;Inherit;False;3;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.VertexColorNode;402;-619.9297,-3256.131;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DesaturateOpNode;246;-858.3483,-1696.555;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;189;-952.4899,-2572.445;Inherit;False;FLOAT2;4;0;FLOAT;1;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;1;-729.4971,-3440.526;Inherit;True;Property;_Main_Tex;Main_Tex;2;0;Create;True;0;0;0;False;0;False;-1;None;3bc439a534eb52543a6e73589e37ef74;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;192;-1119.49,-2794.445;Inherit;False;0;67;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DesaturateOpNode;247;-822.3165,-1576.144;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;351;-284.657,-3471.648;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;279;-641.8257,-1686.425;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;293;-22.38394,-1633.139;Inherit;False;Property;_Dissolve_Str;Dissolve_Str;24;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;191;-783.4899,-2743.445;Inherit;True;2;2;0;FLOAT2;0,0;False;1;FLOAT2;1,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ColorNode;232;-256.1128,-1652.354;Inherit;False;Property;_Dissolve_Color;Dissolve_Color;20;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;394;-2720.903,-266.6238;Inherit;False;3197.066;538.8152;VertexOffset;16;369;368;357;362;359;361;360;390;391;372;375;377;378;376;396;380;VertexOffset;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;99;-31.36832,-3460.314;Inherit;True;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.Vector4Node;410;2028.051,-2060.401;Inherit;False;Property;_fresnel;fresnel;37;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,1,5,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;280;-459.8036,-1709.516;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;360;-2501.075,-113.8635;Inherit;False;Property;_Offset_U;Offset_U;32;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;283;156.2567,-1673.965;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;361;-2657.075,-90.86304;Inherit;False;Property;_Offset_V;Offset_V;33;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;67;-550.9333,-2720.086;Inherit;True;Property;_Mask;Mask;6;0;Create;True;0;0;0;False;0;False;-1;None;None;True;1;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FresnelNode;406;2219.12,-2085.504;Inherit;True;Standard;WorldNormal;ViewDir;False;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;375;-1756.825,35.84472;Inherit;False;Property;_Voronoi;Voronoi;35;0;Create;True;0;0;0;False;0;False;1,1,0,0;1,1,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;359;-2185.075,-62.86301;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;362;-2339.075,-108.863;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;167;236.3901,-3452.18;Inherit;False;TexColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;310;304.7077,-1678.46;Inherit;False;DissolveLightline;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;314;-67.54974,-1712.975;Inherit;False;Dissolve;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;324;917.8854,-3589.899;Inherit;False;2831.243;1406.503;Out;35;307;309;308;213;105;79;107;106;78;211;284;311;316;212;210;209;24;173;169;21;315;20;103;170;23;341;342;350;353;395;403;412;413;420;421;Out;1,1,1,1;0;0
Node;AmplifyShaderEditor.DesaturateOpNode;352;-232.576,-2715.555;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;311;1290.968,-3060.278;Inherit;True;310;DissolveLightline;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;170;1371.405,-2828.055;Inherit;False;167;TexColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;98;-57.25738,-2694.979;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;20;1240.957,-2725.805;Float;False;InstancedProperty;_Main_Color;Main_Color;1;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;0.01281594,0.1145261,0.3018868,0.2039216;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;315;1471.675,-2712.048;Inherit;False;314;Dissolve;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;411;2630.333,-2020.288;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;212;1992.436,-2816.607;Inherit;False;Property;_Depth;Depth;26;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;378;-1786.749,-194.6938;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;376;-1552.537,-55.134;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;103;1175.612,-2802.522;Float;False;Property;_Main_Str;Main_Str;7;0;Create;True;0;0;0;False;0;False;1;71.35;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;168;210.3931,-3096.315;Inherit;False;TexAlpha;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.VertexColorNode;23;959.8188,-2765.668;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PannerNode;357;-1974.075,-128.863;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;422;2832.362,-2140.385;Inherit;False;Property;_OneMinus;OneMinus;39;0;Create;True;0;0;0;False;0;False;0;0;1;True;;Toggle;2;Key0;Key1;Create;True;True;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;377;-1246.985,-186.4832;Inherit;False;3;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;341;1943.402,-2440.144;Inherit;False;Constant;_Float0;Float 0;27;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;172;204.832,-2698.945;Inherit;True;Mask;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;350;1654.906,-3038.581;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.DepthFade;209;2150.843,-2833.924;Inherit;False;True;False;True;2;1;FLOAT3;0,0,0;False;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;413;2890.219,-2360.755;Inherit;False;Constant;_Float2;Float 2;38;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;21;1684.491,-2825.235;Inherit;False;5;5;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;169;1927.835,-2526.378;Inherit;False;168;TexAlpha;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;316;1852.422,-2682.094;Inherit;False;314;Dissolve;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PosVertexDataNode;380;-798.1625,181.218;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;342;2150.402,-2527.144;Inherit;False;Property;_TexAlpha;TexAlpha;10;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;False;True;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.Vector3Node;390;-805.6195,25.31738;Inherit;False;Property;_Vertex_Offset;Vertex_Offset;36;0;Create;True;0;0;0;False;0;False;0,0,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleAddOpNode;284;1960.619,-2916.834;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;412;3045.061,-2290.516;Inherit;False;Property;_Fresnel_Mask;Fresnel_Mask;38;0;Create;True;0;0;0;False;0;False;0;0;1;True;;Toggle;2;Key0;Key1;Create;True;True;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.VoronoiNode;372;-1063.977,-36.29688;Inherit;True;0;1;1;1;1;False;1;False;False;False;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;3;FLOAT;0;FLOAT2;1;FLOAT2;2
Node;AmplifyShaderEditor.SaturateNode;210;2410.898,-2834.478;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;173;2215.432,-2382.858;Inherit;False;172;Mask;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;391;-502.0116,-46.39649;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;211;2891.905,-2914.238;Inherit;False;4;4;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;24;2737.438,-2632.286;Inherit;True;6;6;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;COLOR;0,0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;368;-364.6835,-82.85059;Inherit;False;Constant;_Float1;Float 1;32;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;353;3091.028,-2920.622;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;213;3056.987,-2727.562;Inherit;True;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;369;-160.6835,-75.85059;Inherit;False;Property;_OffsetSwitch;OffsetSwitch;34;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;False;True;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.AbsOpNode;421;3298.39,-2725.403;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;396;170.2882,-4.412148;Inherit;False;VertexOffset;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.AbsOpNode;420;3291.39,-2916.403;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;106;3456.625,-3168.459;Float;False;Property;_CullMode;Cull Mode;27;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DesaturateOpNode;339;-344.0972,-3337.709;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;308;3453.159,-3450.382;Inherit;False;Property;_Dissolve;--------------------------------------Dissolve--------------------------------------------;11;1;[Enum];Create;True;0;1;Dissolve;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;107;3457.625,-3100.459;Inherit;False;Property;_ZWriteMode;ZWrite Mode;28;1;[Enum];Create;True;0;2;On;1;Off;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;79;3458.323,-3233.628;Float;False;Property;_Dst;Dst;31;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.BlendMode;True;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;100;-49.1944,-2999.042;Inherit;True;4;4;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;395;3741.579,-2784.286;Inherit;False;396;VertexOffset;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;309;3456.607,-3373.219;Inherit;False;Property;_Custom;--------------------------------------Custom--------------------------------------------;25;1;[Enum];Create;True;0;1;custom;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;78;3457.323,-3300.628;Float;False;Property;_Src;Src;30;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.BlendMode;True;0;False;5;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;105;3438.779,-2915.986;Inherit;True;COLOR;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;307;3452.094,-3529.333;Inherit;False;Property;_MainTex_Select;--------------------------------------MainTex--------------------------------------------;0;1;[Enum];Create;False;0;1;MainTex;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;403;3461.056,-3029.803;Inherit;False;Property;_ZTestMode;ZTest Mode;29;1;[Enum];Create;True;0;5;Default;0;Less;1;Option3;2;Option4;3;Option5;4;1;UnityEngine.Rendering.CompareFunction;True;0;False;4;4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;398;4005.949,-2914.698;Float;False;True;-1;2;ASEMaterialInspector;100;1;Shader/Class_02UV_Noise;0770190933193b94aaa3065e307002fa;True;Unlit;0;0;Unlit;2;True;True;1;0;True;78;0;True;79;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;0;False;-1;True;True;0;True;106;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;True;1;True;107;True;0;True;403;True;False;0;False;-1;0;False;-1;True;1;RenderType=Transparent=RenderType;True;2;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=ForwardBase;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;1;True;False;;False;0
WireConnection;75;0;82;3
WireConnection;75;1;82;4
WireConnection;71;0;15;0
WireConnection;71;1;75;0
WireConnection;60;0;71;0
WireConnection;60;1;76;0
WireConnection;33;1;60;0
WireConnection;340;0;33;0
WireConnection;404;0;340;0
WireConnection;404;1;405;0
WireConnection;344;0;348;0
WireConnection;344;1;349;0
WireConnection;418;0;404;0
WireConnection;418;1;419;0
WireConnection;346;0;344;0
WireConnection;346;1;343;0
WireConnection;292;0;282;0
WireConnection;317;0;154;0
WireConnection;194;1;151;0
WireConnection;194;0;180;1
WireConnection;290;0;292;0
WireConnection;347;0;301;0
WireConnection;347;1;346;0
WireConnection;347;2;418;0
WireConnection;295;0;347;0
WireConnection;295;1;298;0
WireConnection;295;2;299;0
WireConnection;305;1;347;0
WireConnection;288;0;194;0
WireConnection;288;1;290;0
WireConnection;221;0;288;0
WireConnection;221;1;319;0
WireConnection;153;0;194;0
WireConnection;153;1;318;0
WireConnection;306;1;305;1
WireConnection;306;0;295;0
WireConnection;156;0;194;0
WireConnection;156;4;153;0
WireConnection;224;0;306;0
WireConnection;223;0;288;0
WireConnection;223;4;221;0
WireConnection;143;0;306;0
WireConnection;5;0;82;1
WireConnection;5;1;82;2
WireConnection;225;0;224;0
WireConnection;225;1;223;0
WireConnection;144;0;320;0
WireConnection;155;0;143;0
WireConnection;155;1;156;0
WireConnection;16;0;5;0
WireConnection;16;1;15;0
WireConnection;216;0;187;2
WireConnection;145;0;155;0
WireConnection;145;1;144;0
WireConnection;217;0;187;3
WireConnection;227;0;225;0
WireConnection;227;1;144;0
WireConnection;8;0;9;0
WireConnection;8;1;16;0
WireConnection;8;2;404;0
WireConnection;246;0;145;0
WireConnection;189;0;216;0
WireConnection;189;1;217;0
WireConnection;1;1;8;0
WireConnection;247;0;227;0
WireConnection;351;0;1;0
WireConnection;351;1;1;4
WireConnection;351;2;402;4
WireConnection;279;0;246;0
WireConnection;279;1;247;0
WireConnection;191;0;192;0
WireConnection;191;1;189;0
WireConnection;99;0;351;0
WireConnection;99;1;33;0
WireConnection;99;2;33;4
WireConnection;280;0;246;0
WireConnection;280;1;279;0
WireConnection;283;0;279;0
WireConnection;283;1;232;0
WireConnection;283;2;293;0
WireConnection;67;1;191;0
WireConnection;406;1;410;1
WireConnection;406;2;410;2
WireConnection;406;3;410;3
WireConnection;362;0;360;0
WireConnection;362;1;361;0
WireConnection;167;0;99;0
WireConnection;310;0;283;0
WireConnection;314;0;280;0
WireConnection;352;0;67;0
WireConnection;98;0;352;0
WireConnection;98;1;67;4
WireConnection;411;0;406;0
WireConnection;376;0;375;1
WireConnection;376;1;375;2
WireConnection;168;0;351;0
WireConnection;357;0;359;0
WireConnection;357;2;362;0
WireConnection;422;1;406;0
WireConnection;422;0;411;0
WireConnection;377;0;378;0
WireConnection;377;1;376;0
WireConnection;377;2;357;0
WireConnection;172;0;98;0
WireConnection;350;0;311;0
WireConnection;350;1;170;0
WireConnection;209;0;212;0
WireConnection;21;0;170;0
WireConnection;21;1;103;0
WireConnection;21;2;23;0
WireConnection;21;3;20;0
WireConnection;21;4;315;0
WireConnection;342;1;169;0
WireConnection;342;0;341;0
WireConnection;284;0;350;0
WireConnection;284;1;21;0
WireConnection;412;1;413;0
WireConnection;412;0;422;0
WireConnection;372;0;377;0
WireConnection;372;1;375;3
WireConnection;372;2;375;4
WireConnection;210;0;209;0
WireConnection;391;0;372;0
WireConnection;391;1;390;0
WireConnection;391;2;380;0
WireConnection;211;0;284;0
WireConnection;211;1;210;0
WireConnection;211;2;173;0
WireConnection;211;3;412;0
WireConnection;24;0;20;4
WireConnection;24;1;23;4
WireConnection;24;2;316;0
WireConnection;24;3;342;0
WireConnection;24;4;173;0
WireConnection;24;5;412;0
WireConnection;353;0;211;0
WireConnection;213;0;210;0
WireConnection;213;1;24;0
WireConnection;369;1;368;0
WireConnection;369;0;391;0
WireConnection;421;0;213;0
WireConnection;396;0;369;0
WireConnection;420;0;353;0
WireConnection;339;0;1;0
WireConnection;100;0;339;0
WireConnection;100;1;340;0
WireConnection;100;2;33;4
WireConnection;100;3;1;4
WireConnection;105;0;420;0
WireConnection;105;3;421;0
WireConnection;398;0;105;0
WireConnection;398;1;395;0
ASEEND*/
//CHKSM=19FB65747FA590988192E7D949762781D5ACDF39