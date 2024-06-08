import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["icon", "count"];

  like() {
    console.log("Liked!")
  }
}
