uniform lowp vec4 tint;
varying mediump vec3 var_color;

void main()
{
    // Pre-multiply alpha since all runtime textures already are
    vec4 tint_pm = vec4((tint.xyz * var_color) * tint.w, tint.w);

    gl_FragColor = tint_pm;
}

