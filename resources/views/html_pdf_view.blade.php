<?php
  if (!empty($list)) {
    $columns = array_keys((array) $list[0]);
  }else{
    $columns = array();
  }
?>
<html>
  <body>
    <h4><?=$title;?></h4>
    <table cellpadding="3" cellspacing="0" style="border: solid 1px">
      <thead>
        <?php 
          if(!empty($columns)) {
            echo '<tr >';
            $found_year = false;
              foreach($columns as $cv){
                if ($cv == 'year') {
                  $found_year = true;
                }
                if ($cv == 'tahun' && $found_year == true) {
                  continue;
                }
                echo "<th style='border: solid 1px'>".ucfirst($cv)."</th>";
              } 
            echo '</tr>';
          }
        ?>
      </thead>
      <tbody>
        <?php 
          if(!empty($columns)) {
            foreach($list as $key){
              echo "<tr>";
              foreach($columns as $cv){
                if ($cv == 'year') {
                  $found_year = true;
                }
                if ($cv == 'tahun' && $found_year == true) {
                  continue;
                }
                echo "<td style='border: solid 1px'>".$key->$cv."</td>";
              } 
              echo "</tr>";
            } 
          }
        ?>
      </tbody>
    </table>
  </body>
</html>