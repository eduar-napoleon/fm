import { entityFormFilePicker, textFormFilePicker } from "mini-file-manager";
// import { textFormFilePicker } from "mini-file-manager";
import "mini-file-manager/dist/style.css";

document.querySelectorAll("[data-text-form-file-picker").forEach((elt) => {
  textFormFilePicker(elt);
});

document.querySelectorAll("[data-entity-form-file-picker").forEach((elt) => {
  entityFormFilePicker(elt);
});
