<?php
require_once 'core/init.php';

if(Session::exists('home')){
	echo '<p>' . Session::flash('home') . '</p>';
}
$user = new User();
if($user->isloggedIn()) {
	//echo 'logged in';
?>
	<p>Hello <a href="#"><?php echo escape($user->data()->username); ?></a></p>
	
	
	<ul>
		<li>
			<a href="logout.php">Log Out</a>
		</li>
		<li>
			<a href="update.php">Update Profile</a>
		</li>
		<li>
			<a href="changepassword.php">Change Password</a>
		</li>
		
	</ul>
<?php
} else {
	echo '<p>You need to <a href="login.php">login </a> or <a href="register.php">register</a></p>';
}





























/*if(Session::exists('success')){
	echo Session::flash('success');
}

//echo Config::get('mysql/host');
//echo Config::get('mysql/db');


//$user = DB::getInstance()->get('users' , array('username' , '=' , 'ree'));
$user = DB::getInstance()->update('users' , '3', array(
'password' => 'newone',
'username' => 'DALE'
));




if(!$user->count()){
	echo 'No user';
}else{
	echo $user->first()->username;
	echo 'OKi';
	foreach($user->results() as $user){
		echo $user->username;
	}
}
 $username = 'ree';
try {
    $conn = new PDO('mysql:host=localhost;dbname=oop_login', 'root','');
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
 
    $stmt = $conn->prepare('SELECT password FROM users WHERE username = :username');
	$stmt->execute(array('username' => $username));
 
    while($row = $stmt->fetch()) {
        print_r($row); 
    }
} catch(PDOException $e) {
    echo  $e->getMessage();
}
 */