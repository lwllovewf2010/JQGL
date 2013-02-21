precision mediump float;
varying vec2 vTexture;
uniform sampler2D sTexture111;//纹理内容数据
void main()                         
{           
   //给此片元从纹理中采样出颜色值            
   gl_FragColor = texture2D(sTexture111, vTexture); 
}