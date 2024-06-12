import { Controller } from "@hotwired/stimulus"
import { Canvas, Rect, IText, Image } from 'fabric'; // browser

// Connects to data-controller="texteditor"
export default class extends Controller {
  static targets = ["canvas", "image"]

  connect() {
    if (this.hasCanvasTarget) {
      this.canvas = new Canvas(this.canvasTarget)

      const imgInstance = new Image(this.imageTarget, {
        left: 0,
        top: 0,
        scaleX: this.canvas.width / this.imageTarget.width,
        scaleY: this.canvas.height / this.imageTarget.height,
      })
      this.canvas.add(imgInstance)
    }
  }

  addText() {
    let text = new IText('Sample Text', {
      left:this.canvas.width /2,
      left:this.canvas.height /2,
      fill: '#e0f7fa',
      fontFamily: 'montserrat',
      hasRotatingPoint: true,
      centerTransform: true,
      orignX: 'center',
      orignY: 'center',
      lockUniScaling: true
    });

    this.canvas.add(text);
  }

  save() {
    const dataURL = this.canvas.toDataURL('image/png')
    const link = document.createElement('a')
    link.href = dataURL
    link.download = "meme.png"
    link.click()
  }
}
