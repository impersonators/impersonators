window.onload = function(){

	//set variables for input boxes clear on focus
	var nameInput = document.getElementsByClassName('contact-content__form__input')[0];
	var emailInput = document.getElementsByClassName('contact-content__form__input')[1];
	var messageInput = document.getElementsByClassName('contact-content__form__input__message')[0];
	var buttonImage = document.getElementsByClassName('omggmo')[0];

	if(nameInput != null){
		//add click to button image(jack image)
		buttonImage.addEventListener('click', function() {
			changeContent();
		});
		//add onfocus event listener to inbut boxes
		nameInput.addEventListener('click', function(){
			valueClear(nameInput)
		});
		emailInput.addEventListener('click', function(){
			valueClear(emailInput)
		});
		messageInput.addEventListener('click', function(){
			valueClear(messageInput)
		});
	}
}

//change input boxes to greeting on click
function changeContent(){
	//set emailInput for this function
	var emailInput = document.getElementsByClassName('contact-content__form__input')[1];
	//if statement for if emailInput contains @
	if (emailInput.value.search('@') > -1){
		//set variables of what to change
		var buttonImage = document.getElementById('contact-content__button__image');
		var emptyContent = document.getElementById('contact-content__form__empty-content');
		var submittedContent = document.getElementById('contact-content__form__submitted-content');
		var contentHeading = document.getElementById('contact-heading');
		//make change to main content of contact page
		emptyContent.style.display = 'none';
		submittedContent.style.display = 'flex';
		buttonImage.src = "../images/jack_empty.jpg";
		contentHeading.innerHTML = " ";
	};
	//if statement for if emailInput does not contain @
	if (emailInput.value.search('@') == -1){
		var emailNotice = document.getElementsByClassName('conact-content__form__email__notice')[0];
		emailNotice.style.display = "block";
		valueClear(emailInput);
	};
};



//change input boxes to clear on focus
function valueClear(input){
	input.value = " ";
};
