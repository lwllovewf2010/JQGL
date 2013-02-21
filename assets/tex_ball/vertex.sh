uniform mat4 sMVPMatrix; //�ܱ任����
uniform mat4 changeMatrix;//�仯����
uniform vec3 aLightlocation;//��Դλ��
uniform vec3 creamLocation;//�����λ��

attribute vec3 sPosition;  //����λ��
attribute vec2 aTexture;//������������

varying vec2 vTexture;//���ݸ�ƬԪ��ɫ������������
varying vec4 diffLight;//���ݸ�ƬԪ��ɫ����ɢ���ǿ��
varying vec4 specLight;//�����ǿ��
varying vec4 envi;//������ǿ��

void getLight(){
	
	//������
	envi = vec4(0.2,0.2,0.2,1.0);
	//ɢ���
	vec4 diffli = vec4(1.0,1.0,1.0,1.0);
	//�����
	vec4 specular = vec4(0.3,0.3,0.3,1.0);
	
	//0 ����������ĵ�
	vec3 faD = sPosition + sPosition;

	//1 ��񻯷�����
	vec3 faX = normalize((changeMatrix * vec4(faD,1)).xyz - (changeMatrix * vec4(sPosition,1)).xyz);

	//2 ��񻯹�Դ����
        vec3 lightX = normalize(aLightlocation - (changeMatrix * vec4(sPosition,1)).xyz);

	//���������Դ�����ĵ��
	float cosLight = max(dot(faX,lightX),0.0);
	
	//������յ�ɢ���ǿ��
	diffLight = diffli * cosLight;

	//����⴦��
	//1 ��񻯹۲������
	vec3 lookLocation = normalize(creamLocation - (changeMatrix * vec4(sPosition,1)).xyz);

	//2 ����۲���������Դ�����İ�����
	vec3 halfx = normalize(lookLocation + lightX);

	//3 ����������뷨�����ĵ��
	float cosSpeLight = dot(halfx,faX);
	
	//��������
	float fanSe = 50.0;

	//4 ������վ����ǿ��
	specLight = specular * max(0.0,pow(cosSpeLight,fanSe));

}
void main()     
{                            		
   gl_Position = sMVPMatrix * vec4(sPosition,1); //�����ܱ任�������˴λ��ƴ˶���λ��
   vTexture = aTexture;
   getLight();
}                      