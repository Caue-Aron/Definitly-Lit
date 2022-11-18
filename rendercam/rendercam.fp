uniform lowp vec4 tint;

varying mediump vec3 var_normal;
varying vec3 var_light_dir;

void main()
{
    vec4 tint_pm = vec4(tint.xyz * tint.w, 1.0);

    //ambient
    float ambient_strength = 0.35;
    vec3 ambient = vec3(1, 1, 1) * ambient_strength;

    // diffuse
    float diff = max(dot(var_normal, var_light_dir), 0.0);

    // diff = step(0.5, diff);
    vec3 diffuse = vec3(1, 1, 1) * diff;
 
    vec3 res = (diffuse + ambient) * tint_pm.xyz;

    gl_FragColor = vec4(res, 1.0);
}

