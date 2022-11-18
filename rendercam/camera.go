components {
  id: "script"
  component: "/rendercam/camera.script"
  position {
    x: 0.0
    y: 0.0
    z: 0.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
  properties {
    id: "orthographic"
    value: "false"
    type: PROPERTY_TYPE_BOOLEAN
  }
  properties {
    id: "nearZ"
    value: "-1000.0"
    type: PROPERTY_TYPE_NUMBER
  }
  properties {
    id: "farZ"
    value: "1000.0"
    type: PROPERTY_TYPE_NUMBER
  }
  properties {
    id: "viewDistance"
    value: "1000.0"
    type: PROPERTY_TYPE_NUMBER
  }
}
components {
  id: "moveCam"
  component: "/rendercam/moveCam.script"
  position {
    x: 0.0
    y: 0.0
    z: 0.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
  properties {
    id: "movement_speed"
    value: "20.0"
    type: PROPERTY_TYPE_NUMBER
  }
}
components {
  id: "cam_mesh"
  component: "/rendercam/cam_mesh.model"
  position {
    x: 0.0
    y: 0.0
    z: 0.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
}
