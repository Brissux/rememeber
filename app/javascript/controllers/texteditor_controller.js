import { Controller } from "@hotwired/stimulus"
import { Canvas, Rect, IText, Image as FabricImage } from 'fabric'; // Assurez-vous d'importer `Image` avec un alias

// Connects to data-controller="texteditor"
export default class extends Controller {
  static targets = ["canvas", "image", "input", "form", "editButton"]

  connect() {
    this.waitForImage(this.imageTarget)
  }

  waitForImage(img) {
    if(img.height) {
      setTimeout(() => {
        this.setCanvas()
      }, 100);
    } else {
      setTimeout(() => {
        this.waitForImage(img);
      }, 100);
    }
  }

  setCanvas() {
    this.canvas = new Canvas(this.canvasTarget, {
      preserveObjectStacking: true,
      allowTouchScrolling: true, // Désactiver le défilement
      selection: false
    })

    const imgInstance = new FabricImage(this.imageTarget, {
      left: 0,
      top: 0,
      scaleX: this.canvas.width / this.imageTarget.width,
      scaleY: this.canvas.width / this.imageTarget.width,
      lockMovementX: true,
      lockMovementY: true,
      lockScalingX: true,
      lockScalingY: true,
      lockRotation: true,
      selectable: false,
      evented: false
    })
    if (this.hasCanvasTarget) {
      this.canvas.add(imgInstance)
      this.canvas.setDimensions({ height: this.imageTarget.height * (this.canvas.width / this.imageTarget.width) })
    }
  }

  addText() {
    let text = new IText('Votre texte', {
      left: 180,
      top: 100,
      fill: '#e0f7fa',
      fontFamily: 'montserrat',
      hasRotatingPoint: true,
      centerTransform: true,
      originX: 'center',
      originY: 'center',
      lockUniScaling: true
    })
    text.set('backgroundColor', "rgba(0,0,0,0.5)")
    this.canvas.add(text)
    this.canvas.setActiveObject(text); // Définir le texte comme l'objet actif
    text.enterEditing(); // Entrer en mode d'édition
    text.selectAll(); // Sélectionner tout le texte
  }

  save(event) {
    const dataURL = this.canvas.toDataURL('image/png')
    console.log(`dataURL : ${dataURL}`)
    this.inputTarget.value = dataURL
    this.formTarget.submit()
  }

  hideButton() {
    this.editButtonTarget.classList.remove('d-none');
  }

}
