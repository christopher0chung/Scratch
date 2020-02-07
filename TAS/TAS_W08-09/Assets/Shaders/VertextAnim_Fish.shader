// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "VertextAnim_Fish"
{
	Properties
	{
		_AnimMagnitude("Anim Magnitude", Float) = 0
		_AnimPeriod("Anim Period", Float) = 0
		_AnimFrequency("Anim Frequency", Float) = 0
		_DistanceScalar("Distance Scalar", Float) = 0
		_Albedo("Albedo", Color) = (0,0,0,0)
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows vertex:vertexDataFunc 
		struct Input
		{
			half filler;
		};

		uniform float _AnimFrequency;
		uniform float _AnimPeriod;
		uniform float _AnimMagnitude;
		uniform float _DistanceScalar;
		uniform float4 _Albedo;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float3 ase_vertex3Pos = v.vertex.xyz;
			float4 appendResult3 = (float4(( sin( ( ( _Time.y * _AnimFrequency ) + ( ase_vertex3Pos.y * _AnimPeriod ) ) ) * _AnimMagnitude * ( max( ( ase_vertex3Pos.y * -1 ) , 0.0 ) * _DistanceScalar ) ) , 0.0 , 0.0 , 0.0));
			v.vertex.xyz += appendResult3.xyz;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			o.Albedo = _Albedo.rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16301
7;7;1906;1004;1512.397;118.8444;1;True;False
Node;AmplifyShaderEditor.PosVertexDataNode;1;-1097.073,482.3857;Float;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleTimeNode;5;-1063.276,299.0844;Float;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;8;-1097.076,387.4846;Float;False;Property;_AnimFrequency;Anim Frequency;2;0;Create;True;0;0;False;0;0;7;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;9;-1052.876,624.0846;Float;False;Property;_AnimPeriod;Anim Period;1;0;Create;True;0;0;False;0;0;30;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;11;-857.8758,465.4849;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;10;-863.0762,301.6841;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleNode;18;-862.397,550.1556;Float;False;-1;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;7;-696.6783,304.2841;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;16;-765.3967,603.1556;Float;False;Property;_DistanceScalar;Distance Scalar;3;0;Create;True;0;0;False;0;0;8;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;17;-700.397,511.1556;Float;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;6;-545.8779,304.2845;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;13;-626.4766,404.3845;Float;False;Property;_AnimMagnitude;Anim Magnitude;0;0;Create;True;0;0;False;0;0;0.02;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;15;-559.3967,523.1556;Float;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;12;-389.877,302.9842;Float;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;3;-213.0776,270.4846;Float;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.ColorNode;19;-636.397,-94.8444;Float;False;Property;_Albedo;Albedo;4;0;Create;True;0;0;False;0;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;VertextAnim_Fish;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;11;0;1;2
WireConnection;11;1;9;0
WireConnection;10;0;5;0
WireConnection;10;1;8;0
WireConnection;18;0;1;2
WireConnection;7;0;10;0
WireConnection;7;1;11;0
WireConnection;17;0;18;0
WireConnection;6;0;7;0
WireConnection;15;0;17;0
WireConnection;15;1;16;0
WireConnection;12;0;6;0
WireConnection;12;1;13;0
WireConnection;12;2;15;0
WireConnection;3;0;12;0
WireConnection;0;0;19;0
WireConnection;0;11;3;0
ASEEND*/
//CHKSM=BDF881157471859467DE79D6CC74D6DAFE1C839E