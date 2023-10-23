<?php 

/**
 * SharedController Controller
 * @category  Controller / Model
 */
class SharedController extends BaseController{
	
	/**
     * user_username_value_exist Model Action
     * @return array
     */
	function user_username_value_exist($val){
		$db = $this->GetModel();
		$db->where("username", $val);
		$exist = $db->has("user");
		return $exist;
	}

	/**
     * user_email_value_exist Model Action
     * @return array
     */
	function user_email_value_exist($val){
		$db = $this->GetModel();
		$db->where("email", $val);
		$exist = $db->has("user");
		return $exist;
	}

	/**
     * dana_masuk_kode_anggaran_option_list Model Action
     * @return array
     */
	function dana_masuk_kode_anggaran_option_list(){
		$db = $this->GetModel();
		$sqltext = "SELECT  DISTINCT kode_anggaran AS value,nama_anggaran AS label FROM keuangan ORDER BY nama_anggaran ASC";
		$queryparams = null;
		$arr = $db->rawQuery($sqltext, $queryparams);
		return $arr;
	}

	/**
     * dana_masuk_kelas_option_list Model Action
     * @return array
     */
	function dana_masuk_kelas_option_list(){
		$db = $this->GetModel();
		$sqltext = "SELECT  DISTINCT nama_kelas AS value,nama_kelas AS label FROM kelas";
		$queryparams = null;
		$arr = $db->rawQuery($sqltext, $queryparams);
		return $arr;
	}

	/**
     * dana_keluar_kode_anggaran_option_list Model Action
     * @return array
     */
	function dana_keluar_kode_anggaran_option_list(){
		$db = $this->GetModel();
		$sqltext = "SELECT  DISTINCT kode_anggaran AS value,nama_anggaran AS label FROM keuangan";
		$queryparams = null;
		$arr = $db->rawQuery($sqltext, $queryparams);
		return $arr;
	}

}
