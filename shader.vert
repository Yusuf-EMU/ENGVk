#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(location = 0) out vec3 fragColor;
float sizer = 5;

vec2 tripositions[3] = vec2[](
    vec2(0.0, -0.1),
    vec2(0.1, 0.1),
    vec2(-0.1, 0.1)
);

vec2 trirightpositions[3] = vec2[](
    vec2(-0.1, 0.0),
    vec2(0.0020, 0.1),
    vec2(-0.1, 0.1)
);

vec2 trirightpositionser[6] = vec2[](
    vec2(0.0, 0.0),
    vec2(0.0, 0.0),
    vec2(0.0, 0.0),
    vec2(0.1, -0.0),
    vec2(-0.0020, -0.1),
    vec2(0.1, -0.1)
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

vec3 colorsthreeprong[4] = vec3[](
    vec3(1.0, 0.0, 0.0),
    vec3(0.0, 1.0, 0.0),
    vec3(0.0, 0.0, 1.0),
    vec3(1.0, 0.0, 0.0)
);

void DrawTri(float sizeX, float sizeY) {
    //float triPoses = vec(tripositionsx[gl_VertexIndex], tripositionsy[gl_VertexIndex]);
    //gl_Position = (triPoses, 0.0, 1.0);
    //fragColor = colors[gl_VertexIndex];
}

void DrawTri(float size) {
    gl_Position = vec4((tripositions[gl_VertexIndex] * size), 0.0, 1.0);
    fragColor = colorsthreeprong[gl_VertexIndex];
}

void DrawRightTri(float size) {
    gl_Position = vec4((trirightpositions[gl_VertexIndex] * size), 0.0, 1.0);
    fragColor = colorsthreeprong[gl_VertexIndex];
}

void DrawRightTri(float size, int offset) {
    gl_Position = vec4((trirightpositions[gl_VertexIndex + offset] * size), 0.0, 1.0);
    fragColor = colorsthreeprong[gl_VertexIndex];
}

void DrawRighterTri(float size, int offset) {
    gl_Position = vec4((trirightpositionser[gl_VertexIndex + offset] * size), 0.0, 1.0);
    fragColor = colorsthreeprong[gl_VertexIndex];
}

void main() {
    DrawRightTri(sizer);
    DrawRighterTri(-sizer, 3);

    //gl_Position = vec4(tripositions[gl_VertexIndex], 0.0, 1.0);
    //fragColor = colors[gl_VertexIndex];
}
