<?php 
/**
 * Dana_masuk Page Controller
 * @category  Controller
 */
class Dana_masukController extends SecureController{
	function __construct(){
		parent::__construct();
		$this->tablename = "dana_masuk";
	}
	/**
     * List page records
     * @param $fieldname (filter record by a field) 
     * @param $fieldvalue (filter field value)
     * @return BaseView
     */
	function index($fieldname = null , $fieldvalue = null){
		$request = $this->request;
		$db = $this->GetModel();
		$tablename = $this->tablename;
		$fields = array("id_masuk", 
			"kode_anggaran", 
			"nama", 
			"kelas", 
			"tanggal", 
			"dana_masuk", 
			"keterangan");
		$pagination = $this->get_pagination(MAX_RECORD_COUNT); // get current pagination e.g array(page_number, page_limit)
		//search table record
		if(!empty($request->search)){
			$text = trim($request->search); 
			$search_condition = "(
				dana_masuk.id_masuk LIKE ? OR 
				dana_masuk.kode_anggaran LIKE ? OR 
				dana_masuk.nama LIKE ? OR 
				dana_masuk.kelas LIKE ? OR 
				dana_masuk.tanggal LIKE ? OR 
				dana_masuk.dana_masuk LIKE ? OR 
				dana_masuk.keterangan LIKE ?
			)";
			$search_params = array(
				"%$text%","%$text%","%$text%","%$text%","%$text%","%$text%","%$text%"
			);
			//setting search conditions
			$db->where($search_condition, $search_params);
			 //template to use when ajax search
			$this->view->search_template = "dana_masuk/search.php";
		}
		if(!empty($request->orderby)){
			$orderby = $request->orderby;
			$ordertype = (!empty($request->ordertype) ? $request->ordertype : ORDER_TYPE);
			$db->orderBy($orderby, $ordertype);
		}
		else{
			$db->orderBy("dana_masuk.id_masuk", ORDER_TYPE);
		}
		if($fieldname){
			$db->where($fieldname , $fieldvalue); //filter by a single field name
		}
		$tc = $db->withTotalCount();
		$records = $db->get($tablename, $pagination, $fields);
		$records_count = count($records);
		$total_records = intval($tc->totalCount);
		$page_limit = $pagination[1];
		$total_pages = ceil($total_records / $page_limit);
		if(	!empty($records)){
			foreach($records as &$record){
				$record['tanggal'] = format_date($record['tanggal'],'d-m-Y');
			}
		}
		$data = new stdClass;
		$data->records = $records;
		$data->record_count = $records_count;
		$data->total_records = $total_records;
		$data->total_page = $total_pages;
		if($db->getLastError()){
			$this->set_page_error();
		}
		$page_title = $this->view->page_title = "Dana Masuk";
		$this->view->report_filename = date('d-m-Y') . '-' . $page_title;
		$this->view->report_title = $page_title;
		$this->view->report_layout = "report_layout.php";
		$this->view->report_paper_size = "A4";
		$this->view->report_orientation = "portrait";
		$this->view->report_hidden_fields = array('id_masuk');
		$this->render_view("dana_masuk/list.php", $data); //render the full page
	}
	/**
     * View record detail 
	 * @param $rec_id (select record by table primary key) 
     * @param $value value (select record by value of field name(rec_id))
     * @return BaseView
     */
	function view($rec_id = null, $value = null){
		$request = $this->request;
		$db = $this->GetModel();
		$rec_id = $this->rec_id = urldecode($rec_id);
		$tablename = $this->tablename;
		$fields = array("dana_masuk.id_masuk", 
			"dana_masuk.kode_anggaran", 
			"keuangan.nama_anggaran AS keuangan_nama_anggaran", 
			"dana_masuk.nama", 
			"dana_masuk.kelas", 
			"dana_masuk.tanggal", 
			"dana_masuk.dana_masuk", 
			"dana_masuk.keterangan");
		if($value){
			$db->where($rec_id, urldecode($value)); //select record based on field name
		}
		else{
			$db->where("dana_masuk.id_masuk", $rec_id);; //select record based on primary key
		}
		$db->join("keuangan", "dana_masuk.kode_anggaran = keuangan.kode_anggaran", "INNER");  
		$record = $db->getOne($tablename, $fields );
		if($record){
			$record['tanggal'] = format_date($record['tanggal'],'d-m-Y');
			$page_title = $this->view->page_title = "View  Dana Masuk";
		$this->view->report_filename = date('Y-m-d') . '-' . $page_title;
		$this->view->report_title = $page_title;
		$this->view->report_layout = "report_layout.php";
		$this->view->report_paper_size = "A4";
		$this->view->report_orientation = "portrait";
		}
		else{
			if($db->getLastError()){
				$this->set_page_error();
			}
			else{
				$this->set_page_error("No record found");
			}
		}
		return $this->render_view("dana_masuk/view.php", $record);
	}
	/**
     * Insert new record to the database table
	 * @param $formdata array() from $_POST
     * @return BaseView
     */
	function add($formdata = null){
		if($formdata){
			$db = $this->GetModel();
			$tablename = $this->tablename;
			$request = $this->request;
			//fillable fields
			$fields = $this->fields = array("kode_anggaran","nama","kelas","tanggal","dana_masuk","keterangan");
			$postdata = $this->format_request_data($formdata);
			$this->rules_array = array(
				'kode_anggaran' => 'required',
				'nama' => 'required',
				'kelas' => 'required',
				'tanggal' => 'required',
				'dana_masuk' => 'required|numeric',
				'keterangan' => 'required',
			);
			$this->sanitize_array = array(
				'kode_anggaran' => 'sanitize_string',
				'nama' => 'sanitize_string',
				'kelas' => 'sanitize_string',
				'tanggal' => 'sanitize_string',
				'dana_masuk' => 'sanitize_string',
				'keterangan' => 'sanitize_string',
			);
			$this->filter_vals = true; //set whether to remove empty fields
			$modeldata = $this->modeldata = $this->validate_form($postdata);
			if($this->validated()){
				$rec_id = $this->rec_id = $db->insert($tablename, $modeldata);
				if($rec_id){
					$this->set_flash_msg("Udah ditambahkan ya", "success");
					return	$this->redirect("dana_masuk");
				}
				else{
					$this->set_page_error();
				}
			}
		}
		$page_title = $this->view->page_title = "Add New Dana Masuk";
		$this->render_view("dana_masuk/add.php");
	}
	/**
     * Delete record from the database
	 * Support multi delete by separating record id by comma.
     * @return BaseView
     */
	function delete($rec_id = null){
		Csrf::cross_check();
		$request = $this->request;
		$db = $this->GetModel();
		$tablename = $this->tablename;
		$this->rec_id = $rec_id;
		//form multiple delete, split record id separated by comma into array
		$arr_rec_id = array_map('trim', explode(",", $rec_id));
		$db->where("dana_masuk.id_masuk", $arr_rec_id, "in");
		$bool = $db->delete($tablename);
		if($bool){
			$this->set_flash_msg("Udah dihapus ya", "success");
		}
		elseif($db->getLastError()){
			$page_error = $db->getLastError();
			$this->set_flash_msg($page_error, "danger");
		}
		return	$this->redirect("dana_masuk");
	}
}
