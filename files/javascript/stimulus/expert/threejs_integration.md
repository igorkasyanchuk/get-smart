## ✨ Combine Stimulus with Three.js for 3D Scenes

Stimulus can manage Three.js lifecycles. Instantiate the renderer and scene in `connect()`, animate in `requestAnimationFrame`, and properly dispose on `disconnect()`.

```javascript
import { Controller } from "@hotwired/stimulus"
import * as THREE from 'three'

export default class extends Controller {
  connect() {
    this.scene = new THREE.Scene()
    this.camera = new THREE.PerspectiveCamera(75, this.element.clientWidth / this.element.clientHeight)
    this.renderer = new THREE.WebGLRenderer()
    this.element.appendChild(this.renderer.domElement)
    this.animate()
  }

  animate = () => {
    this.frameId = requestAnimationFrame(this.animate)
    // scene updates...
    this.renderer.render(this.scene, this.camera)
  }

  disconnect() {
    cancelAnimationFrame(this.frameId)
    this.renderer.dispose()
  }
}
```