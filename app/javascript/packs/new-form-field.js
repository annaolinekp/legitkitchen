const btn = document.querySelector("#new-ingredient-btn");
let counter = 1;
btn.addEventListener("click", event => {
  const ingredientField = `
  <div class="form-inputs">
    <div class="form-group select required recipe_ingredients_ingredient_id">
      <label class="form-control-label select required" for="recipe_ingredients_ingredient_id">Ingredient <abbr title="required">*</abbr></label>
      <select class="form-control select required" name="recipe[ingredients][ingredient_id${counter}]" id="recipe_ingredients_ingredient_id"><option value=""></option>
        <option value="3">Common Cultivated Mushrooms</option>
        <option value="4">Butternut Pumpkin</option>
        <option value="5">Nasturtium</option>
        <option value="6">Taleggio Cheese</option>
        <option value="7">Kiwi Fruit</option>
        <option value="8">Mastic</option>
        <option value="9">Jelly</option>
        <option value="10">Apple Juice Concentrate</option>
        <option value="11">Blue Cheese</option>
        <option value="12">Fennel</option>
        <option value="13">Wheat</option>
        <option value="14">Capers</option>
        <option value="15">Smoked Trout</option>
        <option value="16">Flaxseed</option>
        <option value="17">Taleggio Cheese</option>
        <option value="18">Hot Smoked Salmon</option>
        <option value="19">Grape Seed Oil</option>
        <option value="20">Lotus Root</option>
        <option value="21">Mozzarella</option>
        <option value="22">Celery</option>
        <option value="23">Bay Leaves</option>
        <option value="24">Goat Milk</option>
        <option value="25">Freekeh</option>
        <option value="26">Jerusalem Artichoke</option>
        <option value="27">Cayenne</option>
        <option value="28">Oyster Mushrooms</option>
        <option value="29">Cardamom</option>
        <option value="30">Tuna</option>
        <option value="31">Soy Beans</option>
        <option value="32">Poppy Seed</option>
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
