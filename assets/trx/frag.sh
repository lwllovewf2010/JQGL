precision mediump float;
varying vec2 vTexture;
uniform sampler2D sTexture111;//������������
void main()                         
{           
   //����ƬԪ�������в�������ɫֵ            
   gl_FragColor = texture2D(sTexture111, vTexture); 
}