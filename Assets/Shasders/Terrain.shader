Shader "Hidden/Terrain"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
    }
    SubShader
    {
        // No culling or depth
        Cull Off ZWrite Off ZTest Always

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
                float4 Color : COLOR;
                uint VertexID : VERTEXID;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                //o.uv = v.uv;
                const float2 coords[4] =
                {
                    float2(0, 0),
                    float2(1, 0),
                    float2(0, 1),
                    float2(1, 1)
                };
                o.uv = coords[v.VertexID]
                

                return o;
            }

            sampler2D _MainTex;
            Texture2D<float> UITexture;/*: register(t0, space0);*/
            //SamplerState UISampler : register(s1, space0);

            fixed4 frag (v2f i) : SV_Target
            {
                fixed4 col = tex2D(_MainTex, UITexture);
                // just invert the colors
                
            
                //col.rgb = 1 - col.rgb;
                //return UITexture.Sample(UISampler, input.UV);
                return col;

            }

            //float4 ps_main(vs_out input) : SV_TARGET0
            //{
            //    //for (int x = 0; x < noiseData)
            //    //float4 ReturnValue = texture.;
            ////    float Threshold = 0.3;
            //////float uv = lerp(, 1f, 0.12f);
            ////
            //    //return UITexture.Sample(UISampler, input.UV);
            //    
            //}
            ENDCG
        }
    }
}
