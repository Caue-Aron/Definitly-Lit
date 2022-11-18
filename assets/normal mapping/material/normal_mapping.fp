#define LIGHT_COUNT 8

varying mediump vec2 var_texcoord0;
varying highp   vec3 world_pos;
varying mediump vec3 var_light_pos[LIGHT_COUNT];
varying mediump vec4 var_light_color[LIGHT_COUNT];

varying mediump vec3 var_normal;

uniform vec4 tint;
uniform vec4 light_options;
uniform vec4 light_dir;
uniform vec4 light_dir_color;
uniform vec4 math_vars;
uniform lowp sampler2D tex0;
uniform lowp sampler2D normal_map;

vec3 light_point_calculation(vec3 light_color, vec3 light_pos, vec3 normal, vec3 world_pos);

void main()
{
    // these variables are here just so it wont cause an error in runtime, due to the script for normal map and regular lighting being the same
    float i = light_options.x;
    i = light_dir.x;
    i = light_dir_color.x;


    vec3 result;
    for(int i = 0; i < LIGHT_COUNT; i++)
        if(var_light_color[i].w != 0)
            result += light_point_calculation(
                var_light_color[i].xyz,
                var_light_pos[i],
                var_normal,
                world_pos
            );
    
    
    gl_FragColor = vec4(result * tint.xyz, tint.w);
}

vec3 light_point_calculation(vec3 light_color, vec3 light_pos, vec3 normal, vec3 world_pos)
{
    // ambient
    if (math_vars.w == 1){
        normal = texture(normal_map, var_texcoord0).rgb;
        normal = normalize(normal * 2.0 - 1.0);
    }

    float ambient_strength = 0.2;
    vec3 ambient = ambient_strength * light_color * vec3(texture(tex0, var_texcoord0));
  	
    // diffuse 
    vec3 light_dir = normalize(light_pos - world_pos);
    float diff = max(dot(normal, light_dir), 0.0);
    // diff = step(0.3, diff);
    vec3 diffuse = diff * light_color * vec3(texture(tex0, var_texcoord0));

    float light_distance = length(light_pos - world_pos);
    float attenuation = 1.0 / (math_vars.x + math_vars.y * light_distance + math_vars.z * (light_distance * light_distance));

    ambient *= attenuation;
    diffuse *= attenuation;
            
    return (ambient + diffuse);
}