

//   dashbord

// annuncement
// Show image location file on file choser and validation
$(".custom-file-input").on("change", function() {
  var fileName = $(this).val().split("\\").pop();
  console.log(fileName)
  const  isImage = /(.*?)\.(JPG|jpg|gif|PNG|xml|GIF|bmp|jpeg|png)$/;
  //const  isImage = new RegExp("(.*?)\.(docx|doc|pdf|txt|bmp|ppt|xls)$");
  if (isImage.test(fileName)) {
    this.classList.add('is-valid');
    this.classList.remove('is-invalid');
  }
  else {
    this.classList.add('is-invalid');
    this.classList.remove('is-valid');
  }
  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
});
// Show image location file on file choser and validation end

// Add product form validation


const ProductTitle = document.getElementById('ProductTitle');
ProductTitle.addEventListener('keyup', nameValidation);


function nameValidation(event) {
    var productValue = this.value;
    var nameVlaidator = /^[\.a-zA-Z0-9\.]{4,200}$/;

    if (nameVlaidator.test(productValue)) {
        this.classList.add('is-valid');
        this.classList.remove('is-invalid');
    }
    else {
      this.classList.add('is-invalid');
      this.classList.remove('is-valid');
    }
}
// Add product form validation end



