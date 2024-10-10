#version 150

#moj_import <fog.glsl>

uniform sampler2D Sampler0;

uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;

uniform vec2 ScreenSize;

in float vertexDistance;
in vec4 vertexColor;
in vec2 texCoord0;

out vec4 fragColor;

bool red(vec4 v) {
    // Checks if the color is the scoreboard "red" color
    return v.r == 252.0/255.0 && v.g == 84.0/255.0 && v.b == 84.0/255.0 && v.a == 1.0;
}

void main() {
    vec4 color = texture(Sampler0, texCoord0) * vertexColor * ColorModulator;
    if (color.a < 0.1) {
	    discard;
	}
	
    fragColor = linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);
    // If our color is red and on the scoreboard, discard it
    if (red(fragColor) && ScreenSize.x - gl_FragCoord.x < 52) {
	    discard;
	}
}