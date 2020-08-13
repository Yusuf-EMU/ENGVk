#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(location = 0) out vec3 fragColor;
float sizer = 5;
float pi = 3.14159;
float fov = 70*pi/180;
float f = 1/tan(fov/2);
float aratio = 16/9;
float verts = 13;

vec2 tripositions[3] = vec2[](
    vec2(0.0, -0.1),
    vec2(0.1, 0.1),
    vec2(-0.1, 0.1)
);

vec2 trirightpositions[6] = vec2[](
    vec2(-0.1, 0.0),
    vec2(0.0020, 0.1),
    vec2(-0.1, 0.1),
    vec2(0.1, -0.0),
    vec2(-0.0020, -0.1),
    vec2(0.1, -0.1)
);

vec2 trirightpositionser[6] = vec2[](
    vec2(0.0, 0.0),
    vec2(0.0, 0.0),
    vec2(0.0, 0.0),
    vec2(0.1, -0.0),
    vec2(-0.0020, -0.1),
    vec2(0.1, -0.1)
);

vec2 rectangle[4] = vec2[](
    vec2(0.1, 0.1),
    vec2(-0.1, 0.1),
    vec2(0.1, -0.1),
    vec2(-0.1, -0.1)
);

vec2 vBuffer[15] = vec2[](
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
    vec2(0.1, -0.1),
    vec2(0.0999, -0.0999),
    vec2(-0.0999, -0.0999),
    vec2(0.0999, 0.0999)
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

vec2 vBuufet[] = vec2[](
    vec2(0.0, 0.0),
    vec2(0.0, 0.0),
    vec2(0.0, 0.0),
    vec2(0.0, 0.0),
    vec2(0.0, 0.0),
    vec2(0.0, 0.0),
    vec2(0.0, 0.0),
    vec2(0.0, 0.0),
    vec2(0.0, 0.0),
    vec2(0.0, 0.0),
    vec2(0.0, 0.0),
    vec2(0.0, 0.0)
);

vec2 tripositionsx[3] = vec2[](
    vec2(0.0),
    vec2(0.1),
    vec2(-0.1)
);

vec2 tripositionsy[3] = vec2[](
    vec2(-0.1),
    vec2(0.1),
    vec2(0.1)
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

void DrawTri(float sizeX, float sizeY) {
    //float triPoses = vec(tripositionsx[gl_VertexIndex], tripositionsy[gl_VertexIndex]);
    //gl_Position = (triPoses, 0.0, 1.0);
    //fragColor = colors[gl_VertexIndex];
}

void DrawTri(float size) {
    gl_Position = vec4((tripositions[gl_VertexIndex] * size), 0.0, 1.0);
    fragColor = colorBuffer[gl_VertexIndex];
}

void DrawRightTri(float size) {
    gl_Position = vec4((trirightpositions[gl_VertexIndex] * size), 0.0, 1.0);
    fragColor = colorBuffer[gl_VertexIndex];
}

void DrawRightTri(float size, int offset) {
    gl_Position = vec4((trirightpositions[gl_VertexIndex + offset] * size), 0.0, 1.0);
    fragColor = colorBuffer[gl_VertexIndex];
}

void DrawRighterTri(float size, int offset) {
    gl_Position = vec4((trirightpositionser[gl_VertexIndex + offset] * size), 0.0, 1.0);
    fragColor = colorBuffer[gl_VertexIndex];
}

void Convert3dto2d() {
    float f = tan(fov/2);
    float aratio = 16/9;
    //vBuufet[gl_VertexIndex].x = vBuffer[gl_VertexIndex].x*f*aratio/vBuffer[gl_VertexIndex].z;
    //vBuufet[gl_VertexIndex].y = (vBuffer[gl_VertexIndex].y*f)/vBuffer[gl_VertexIndex].z;
}

void DrawVbuffer(float size) {
    gl_Position = vec4(vBuffer[gl_VertexIndex]*size*projectionmat[gl_VertexIndex], 0.0, zBuffer[gl_VertexIndex]);
    fragColor = colorBuffer[gl_VertexIndex];
}

void main() {
    DrawVbuffer(sizer);
}
