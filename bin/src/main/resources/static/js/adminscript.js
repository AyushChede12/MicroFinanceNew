const handleToggleSidebar = () => {
	document.body.classList.toggle('toggle-sidebar');
}

document.addEventListener('DOMContentLoaded', () => {
	const toggleSidebarBtn = document.querySelector('.toggle-sidebar-btn');
	if (toggleSidebarBtn) {
		toggleSidebarBtn.addEventListener('click', handleToggleSidebar);
	}
});



// view image from image upload

const dropArea = document.getElementById("drop-area");
const inputFile = document.getElementById("input-file");
const imgView = document.getElementById("img-view");
const text = document.getElementById("upload-text");

inputFile.addEventListener("change", uploadImage);

function uploadImage() {
	let imgLink = URL.createObjectURL(inputFile.files[0]);
	imgView.style.backgroundImage = `url(${imgLink})`
	imgView.textContent = "";
	imgView.style.border = 0;
	imgView.style.display = 'block'
	text.style.display = 'none';
}

dropArea.addEventListener("dragover", function (e) {
	e.preventDefault()
})

dropArea.addEventListener("drop", function (e) {
	e.preventDefault()
	inputFile.files = e.dataTransfer.files;
	uploadImage()
})

function changeImage(newImageSrc, selectedThumbnail) {
	var galleryId = selectedThumbnail.closest('.image-gallery').id;
	var bigImage = document.getElementById(galleryId).querySelector('.big-image img');
	bigImage.src = newImageSrc;

	var thumbnails = document.getElementById(galleryId).querySelectorAll('.thumbnail');
	thumbnails.forEach(function (thumbnail) {
		thumbnail.classList.remove('selected');
	});

	selectedThumbnail.classList.add('selected');
}



const drop = document.getElementById('select-btn1');
drop.addEventListener()

// toggal button

document.addEventListener('DOMContentLoaded', () => {
	const toggles = document.querySelectorAll('.toggle__input');

	toggles.forEach((toggle) => {
		// Initialize colors
		updateToggleColor(toggle);

		// console.log("updated toggle" , toggle)

		// Add change event listener
		toggle.addEventListener('change', () => {
			updateToggleColor(toggle);
			// console.log(${ toggle.dataset.toggleType } is now ${ toggle.checked });
		});
	});

	function updateToggleColor(input) {
		const label = input.nextElementSibling;
		if (input.checked) {
			label.style.backgroundColor = '#28a745'; // Green ON
		} else {
			label.style.backgroundColor = '#ccc'; // Gray OFF
		}
	}
});