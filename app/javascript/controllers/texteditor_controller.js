import { Controller } from "@hotwired/stimulus"
import { Canvas, Rect, IText, Image } from 'fabric'; // browser

// Connects to data-controller="texteditor"
export default class extends Controller {
  static targets = ["canvas", "image", "input", "form"]

  connect() {
    window.onload = function() {
      if(!window.location.hash) {
          window.location = window.location + '#loaded';
          window.location.reload();
      }
    }

    if (this.hasCanvasTarget) {
      window.onload()
      this.canvas = new Canvas(this.canvasTarget, {preserveObjectStacking: true})

      const imgInstance = new Image(this.imageTarget, {
        left: 0,
        top: 0,
        scaleX: this.canvas.width / this.imageTarget.width,
        scaleY: this.canvas.width / this.imageTarget.width,
        lockMovementX:Boolean,
        lockMovementY:Boolean,
      })
      this.canvas.add(imgInstance)
      this.canvas.setDimensions({height:this.imageTarget.height * (this.canvas.width / this.imageTarget.width)})
    }
  }

  addText() {
    let text = new IText('Sample Text', {
      left: 0,  //this.canvas.width /2,
      //left:0 //this.canvas.height /2,
      fill: '#e0f7fa',
      fontFamily: 'montserrat',
      hasRotatingPoint: true,
      centerTransform: true,
      orignX: 'center',
      orignY: 'center',
      lockUniScaling: true
    });
    text.set('backgroundColor', "rgba(0,0,0,0.5)");
    this.canvas.add(text);
  }

  // save() {
  //   const dataURL = this.canvas.toDataURL('image/png')
  //   // console.log(`dataURL : ${dataURL}`)
  //   const link = document.createElement('a')
  //   // console.log(`link : ${dataURL}`)
  //   link.href = dataURL
  //   link.download = "meme.png"
  //   link.click()
  //   // // console.dir(link);
  //   // this.inputTarget.filename = dataURL;
  // }

  save(event) {
    const dataURL = this.canvas.toDataURL('image/png')
    console.log(`dataURL : ${dataURL}`)
    this.inputTarget.value = dataURL
    this.formTarget.submit()
  }


}
