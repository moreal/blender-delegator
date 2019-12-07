from uuid import uuid4
from flask import Request, send_file
from subprocess import call

def render(request: Request):
    path = '/tmp'
    suffix = uuid4().hex
    blender_file = f"{path}/blend_{suffix}"
    output_file = f"{path}/output_{suffix}_"
    request.files['blender_file'].save(blender_file)

    render_command = f'/usr/bin/xvfb-run -n 0 /usr/local/blender/blender --background {blender_file} --render-output {output_file} -F PNG --render-frame 1'
    call(render_command, shell=True)

    return send_file(f'{output_file}0001.png', mimetype='image/png')
