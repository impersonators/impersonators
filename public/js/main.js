window.onload = function(){
	//set variable for button image
	var buttonImage = document.getElementById('contact-content__button__image');

	//add click to button image(jack image)
	buttonImage.addEventListener('click', changeContent);

	//set variables for input boxes clear on focus
	var nameInput = document.getElementsByClassName('contact-content__form__input')[0]
	var emailInput = document.getElementsByClassName('contact-content__form__input')[1]
	var messageInput = document.getElementsByClassName('contact-content__form__input__message')[0]

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

//change input boxes to greeting on click	
function changeContent(){
	//set variable for button image, empty content, submitted content and contact-heading
	var buttonImage = document.getElementById('contact-content__button__image');
	var emptyContent= document.getElementById('contact-content__form__empty-content');
	var submittedContent = document.getElementById('contact-content__form__submitted-content');
	var contentHeading = document.getElementById('contact-heading');

	emptyContent.style.display = 'none';
	submittedContent.style.display = 'flex';
	buttonImage.src = "../images/jack_empty.jpg";
	contentHeading.innerHTML = " ";
};

//change input boxes to clear on focus
function valueClear(input){
	input.value = " ";
};

