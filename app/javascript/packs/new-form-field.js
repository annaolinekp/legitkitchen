// import { initSelect2 } from "../components/init_select2";
import 'jquery';
import 'select2';
const btn = document.querySelector("#new-ingredient-btn");
const ingredientsDropdown = document.querySelectorAll("#recipe_ingredients_ingredient_id0 option")
var htmlstr = Array.prototype.reduce.call(ingredientsDropdown, function(html, node) {
    return html + ( node.outerHTML || node.nodeValue );
}, "");

let counter = 1;
btn.addEventListener("click", event => {
  // select.classList.remove('select2');
  const ingredientField = `
  <div class="form-inputs">
    <div class="form-group select required recipe_ingredients_ingredient_id">
      <label class="form-control-label select required" for="recipe_ingredients_ingredient_id">Ingredient <abbr title="required">*</abbr></label>
      <select class="select2${counter} ingredient-dropdown form-control select required" name="recipe[ingredients][ingredient_id${counter}]" id="recipe_ingredients_ingredient_id${counter}"><option value=""></option>
        ${htmlstr}
      </select>
    </div>
  </div>

  <div class="form-inputs">
    <div class="form-group string required recipe_amounts_amount">
      <label class="form-control-label string required" for="recipe_amounts_amount">Add an amount <abbr title="required">*</abbr></label>
      <input class="form-control string required" type="text" name="recipe[amounts][amount${counter}]" id="recipe_amounts_amount">
    </div>
  </div>`;
  btn.parentElement.insertAdjacentHTML('beforebegin', ingredientField);
  $(`.select2${counter}`).select2();
  counter = counter + 1;
  // initSelect2();
});

// const ingredientForm = document.querySelector(".ingredient-dropdown");
// ingredientForm.addEventListener("click", event => {
//   ingredientForm.classList.add('select2');
//   console.log("class added");
//   initSelect2();//do stuff
// }, true)
// console.log(btn);
