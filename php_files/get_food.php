<?php 

$query = 
"SELECT * FROM food_combos";
$result = $conn->query($query);

// Save SQL query result in array
if ($result->num_rows > 0) {
  while ($row = $result->fetch_assoc()) {
    $food_combos[] = [
      'combo_id' => $row['combo_id'],
      'combo_name' => $row['combo_name'],
      'price' => $row['price'],
      'picture_url' => $row['img_url'],
    ];
  };
};

echo "
  <div class='d-flex flex-column' style='gap: 12px;'>
    <h2 style='align-self: start;'>Choose your add-ons:</h2>
    <div class='d-flex flex-row' style='gap: 20px;'>";
      
      foreach ($food_combos as $items) {
      $item_id = str_replace(' ', '_', $items['combo_name']);
        echo "
        <div class='d-flex flex-column' style='gap: 16px;'>
          <img src='{$items['picture_url']}' alt='combo' style='border: 1px solid var(--border-color);'>
          <div style='text-align: center'>
            <p>{$items['combo_name']}</p>
            <p>". number_format($items['price'], 2) . "</p>
          </div>
          <div class='d-flex flex-row align-items-center justify-content-center' style='gap: 16px;'>
            <button class='integer-btn' onclick=\"decreaseValue('{$item_id}')\"><i class='bx bx-minus icon'></i></button>
            <input type='number' id='{$item_id}' class='number-field' value='0' readonly>
            <button class='integer-btn' onclick=\"increaseValue('{$item_id}')\"><i class='bx bx-plus icon'></i></button>
          </div>
        </div>";
      }

      echo "
    </div>
  </div>";

?>