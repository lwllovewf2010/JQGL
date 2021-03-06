precision mediump float;
varying vec2 vTexture;//纹理坐标
varying vec4 diffLight;//散射光强度
varying vec4 specLight;//镜面光强度
varying vec4 envi;//环境光强度

uniform sampler2D sTextureDay;//纹理内容数据
uniform sampler2D sTextureNight;//纹理内容数据
void main()                         
{  
  //给此片元从纹理中采样出颜色值   
  vec4 finalColorDay;   
  vec4 finalColorNight;   
  
  finalColorDay= texture2D(sTextureDay, vTexture);
  finalColorDay = finalColorDay* diffLight +finalColorDay* specLight +finalColorDay * envi;
  finalColorNight = texture2D(sTextureNight, vTexture); 
  finalColorNight = finalColorNight*vec4(0.5,0.5,0.5,1.0);
  
  if(diffLight.x>0.21)
  {
    gl_FragColor=finalColorDay;    
  } 
  else if(diffLight.x<0.05)
  {     
     gl_FragColor=finalColorNight;
  }
  else
  {
     float t=(diffLight.x-0.05)/0.16;
     gl_FragColor=t*finalColorDay+(1.0-t)*finalColorNight;
  }  
}