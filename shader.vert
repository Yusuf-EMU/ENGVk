#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(location = 0) out vec3 fragColor;
//layout(location = 0) in vec2 PosBuffer;
float sizer = 5;
float pi = 3.14159;
float fov = 70*pi/180;
float f = 1/tan(fov/2);
float aratio = 16/9;
//layout(location = 1) out float verts = 13;

vec2 vBuffer[12] = vec2[](
    vec2(-0.1, 0.0),
    vec2(0.1, 0.1),
    vec2(-0.1, 0.1),
    vec2(0.1, -0.0),
    vec2(-0.1, -0.1),
    vec2(0.1, -0.1),
    vec2(0.0, -0.05),
    vec2(0.05, 0.05),
    vec2(-0.05, 0.05),
    vec2(0.1, 0.1),
    vec2(-0.1, 0.1),
    vec2(0.1, -0.1)
);

float zBuffer[] = float[](
    float(1.0),
    float(1.0),
    float(1.0),
    float(1.0),
    float(1.0),
    float(1.0),
    float(1.0),
    float(1.0),
    float(1.0),
    float(2.0),
    float(2.0),
    float(2.0),
    float(2.0),
    float(2.0),
    float(2.0)
);

vec2 projectionmat[] = vec2[](
    vec2(f*aratio, f)
);

vec3 colorBuffer[12] = vec3[](
    vec3(1.0, 0.0, 0.0),
    vec3(0.0, 1.0, 0.0),
    vec3(0.0, 0.0, 1.0),
    vec3(1.0, 0.0, 0.0),
    vec3(0.0, 1.0, 0.0),
    vec3(0.0, 0.0, 1.0),
    vec3(1.0, 0.0, 0.0),
    vec3(0.0, 1.0, 0.0),
    vec3(0.0, 0.0, 0.1),
    vec3(1.0, 0.0, 0.0),
    vec3(0.0, 1.0, 0.0),
    vec3(0.0, 0.0, 1.0)
);
void DrawVbuffer(float size) {
    gl_Position = vec4(vBuffer[gl_VertexIndex]*size*projectionmat[gl_VertexIndex], 0.0, zBuffer[gl_VertexIndex]);
    fragColor = colorBuffer[gl_VertexIndex];
}

void main() {
    DrawVbuffer(sizer);
}
