@type vertex



#version 450 core

layout( location = 0 ) in vec3 a_position;
layout( location = 1 ) in vec2 a_texture_coordinate;

uniform mat4 u_view_projection;
uniform mat4 u_transform;

out vec2 v_texture_coordinate;

void main()
{
    v_texture_coordinate = a_texture_coordinate;
    gl_Position = u_view_projection * u_transform * vec4( a_position, 1.0 );
}

@type fragment



#version 450 core

out vec4 color;

uniform float u_texture_scale;
uniform sampler2D u_texture;
uniform vec4 u_color;

in vec2 v_texture_coordinate;

void main()
{
    color = texture( u_texture, v_texture_coordinate * u_texture_scale ) * u_color;
}
