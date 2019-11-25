<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class RequestData extends Model
{
  protected $table = "request_data";
  public function maker(){
    return $this->belongsTo("App\CmsUser", "cms_user_id");
  }
}
