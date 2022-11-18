varying mediump vec3 var_normal;
varying highp vec4 frag_pos;

#define LIGHT_COUNT 8

varying mediump vec4 var_light_pos[LIGHT_COUNT];
varying mediump vec4 var_light_color[LIGHT_COUNT];
uniform vec4 tint; // the color of the object
uniform vec4 math_vars; // x = 1; y = 0.09; z = 0.0032 and w = 0

// used in case the object has an ambient light
varying mediump vec4 var_light_dir;
uniform mediump vec4 light_dir_color;

// light_options indices are used to store information about how to do lighting (y if 0 tells the shader to do cel shading) 
uniform vec4 light_options;
uniform vec4 cel_shading; // variable used to store up to 4 steps in the cel shading process

uniform lowp sampler2D tex_wood; // the texture of the model (in this case, is a 16x16 wooden floor)
varying mediump vec2 var_wood_coord;

vec3 light_point_calculation(vec3 light_color, vec3 light_pos, vec3 normal, vec3 frag_pos);
vec3 light_dir_calculation(vec3 light_color, vec3 light_dir, vec3 normal);
float cel_shading_calculation(float diff, vec4 cel_shading);

void main()
{
    vec3 result;

    
    // light_options.x tells if the mesh uses a single ambient light source or multiple light sources
    if(light_options.x == 1)
    {
        for(int i = 0; i < LIGHT_COUNT; i++)
        {
            if(var_light_color[i].w != 0)
                result += light_point_calculation(var_light_color[i].xyz, var_light_pos[i].xyz, var_normal, frag_pos.xyz);
        }
    }
    else
        result = light_dir_calculation(light_dir_color.xyz, var_light_dir.xyz, var_normal);
    
    gl_FragColor = vec4((result * tint.xyz) * tint.w, 1);
}

vec3 light_dir_calculation(vec3 light_color, vec3 light_dir, vec3 normal)
{
    // Diffuse light calculations
    float ambient_strength = 0.35;
    vec3 ambient = ambient_strength * vec3(texture(tex_wood, var_wood_coord));
    // diffuse
    float diff = max(dot(normal, light_dir), 0.0);
    // diff = step(0.5, diff);
    vec3 diffuse = diff * light_color * vec3(texture(tex_wood, var_wood_coord));
 
    return (diffuse + ambient);
}

vec3 light_point_calculation(vec3 light_color, vec3 light_pos, vec3 normal, vec3 frag_pos)
{
    // Diffuse light calculations
    float ambient_strength = 0.35;
    vec3 ambient = ambient_strength * vec3(texture(tex_wood, var_wood_coord));
  	
    // diffuse 
    vec3 light_dir = normalize(light_pos - frag_pos);
    float diff = max(dot(normal, light_dir), 0.0);
    // diff = step(0.5, diff);
    vec3 diffuse = diff * light_color * vec3(texture(tex_wood, var_wood_coord));

    float light_distance = length(light_pos - frag_pos);
    float attenuation = 1.0 / (math_vars.x + math_vars.y * light_distance + math_vars.z * (light_distance * light_distance));

    ambient *= attenuation;
    diffuse *= attenuation;
 
    return (diffuse + ambient);
}