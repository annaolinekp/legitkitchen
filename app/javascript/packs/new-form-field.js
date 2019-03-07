const btn = document.querySelector("#new-ingredient-btn");
const ingredientsDropdown = document.querySelectorAll("#recipe_ingredients_ingredient_id0 option")
var htmlstr = Array.prototype.reduce.call(ingredientsDropdown, function(html, node) {
    return html + ( node.outerHTML || node.nodeValue );
}, "");

let counter = 1;
btn.addEventListener("click", event => {
  const ingredientField = `
  <div class="form-inputs">
    <div class="form-group select required recipe_ingredients_ingredient_id">
      <label class="form-control-label select required" for="recipe_ingredients_ingredient_id">Ingredient <abbr title="required">*</abbr></label>
      <select class="form-control select required" name="recipe[ingredients][ingredient_id${counter}]" id="recipe_ingredients_ingredient_id"><option value=""></option>
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
  btn.insertAdjacentHTML('beforebegin', ingredientField);
  counter = counter + 1;
});
// console.log(btn);
