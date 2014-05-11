<?php
require_once 'core/init.php';

$user = new User();

if(!$user->isloggedIn()) {
	Redirect::to('index.php');
}

if(Input::exists())
{
	//if(Token::check(Input::get('token'))){
		
		$validate = new Validate();
		$validation = $validate->check($_POST , array(
			'password_current' => array(
				'required' => true,
				'min' => 6
			),
			'password_new' => array(
				'required' => true,
				'min' => 6
			),
			'password_new_again' => array(
				'required' => true,
				'min' => 6,
				'matches' => 'password_new'
			)
			
		));
		
		if($validation->passed()){
		
			if(Hash::make(Input::get('password_current'), $user->data()->salt)!== $user->data()->password){
				echo 'Please enter the correct current password';
				
			} else {
				$salt= Hash::salt(32);
				$user->update(array(
					'password' => Hash::make(Input::get('password_new'), $salt),
					'salt' => $salt
				));
				
				Session::flash('home' ,'Your password has been updated.');
				Redirect::to('index.php');
			}
			
			/*try{
				$user->update(array(
					'name' => Input::get('name')
				));
				
				Session::flash('home' ,'Your details has been updated.');
				Redirect::to('index.php');
			}catch(Exception $e) {
				die($e->getMessage());
			}*/
			
		}
		else 
		{
			foreach($validation->errors() as $error)
			{
				echo $error, '<br>';
				
			}
		}
		
	//}
} 
?>
<form action="" method ="post">
	<div class ="field">
		<label for="password_current">Current password </label>
		<input type="password" name="password_current" id="password_current">
	</div>
	
	<div class ="field">
		<label for="password_again">New password </label>
		<input type="password" name="password_new" id="password_new">
	</div>
	
	<div class ="field">
		<label for="password_again">New password again</label>
		<input type="password" name="password_new_again" id="password_new_again">
	</div>
	
	<input type="submit" value="Change" >
	<input type="hidden" name="token" value "<?php echo Token::generate();?>">
	
	
</form>