// card validation
console.log('start card js')
const cardNumber = document.getElementById('cardNumber');
cardNumber.addEventListener('keyup', cardValidity);
function cardValidity(event) {
    console.log("card validation ")
    let cardNum = cardNumber.value;
    var validformat = /^(?:4[0-9]{12}(?:[0-9]{3})?|[25][1-7][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})$/;

    if (validformat.test(cardNum)) {
        cardNumber.classList.add('is-valid');
        cardNumber.classList.remove('is-invalid');
    }
    else {
        cardNumber.classList.add('is-invalid');
        cardNumber.classList.remove('is-valid');
    }
}
// Bkash,rocket number validation
const Rocketmobile =document.getElementById('Rocketmobile')
Rocketmobile.addEventListener('keyup',function(event){
    const numberRegex=/^\d{11}$/;
    if(numberRegex.test(this.value)){

        Rocketmobile.classList.add('is-valid');
        Rocketmobile.classList.remove('is-invalid');
    }
    else {
        Rocketmobile.classList.add('is-invalid');
        Rocketmobile.classList.remove('is-valid');
    }

});
const Bkashnumber =document.getElementById('Bkashnumber')
Bkashnumber.addEventListener('keyup',function(event){
    const numberRegex=/^\d{11}$/;
    if(numberRegex.test(this.value)){

        Bkashnumber.classList.add('is-valid');
        Bkashnumber.classList.remove('is-invalid');
    }
    else {
        Bkashnumber.classList.add('is-invalid');
        Bkashnumber.classList.remove('is-valid');
    }

});
// month year validation
const month =document.getElementById('month')
month.addEventListener('keyup',function(event){
    const numberRegex=/^(0?[1-9]|1[012])$/;
    if(numberRegex.test(this.value)){

        month.classList.add('is-valid');
        month.classList.remove('is-invalid');
    }
    else {
        month.classList.add('is-invalid');
        month.classList.remove('is-valid');
    }

});
const yearid =document.getElementById('yearid')
yearid.addEventListener('keyup',function(event){
    const numberRegex=/^(19|20)\d\d$/;
    if(numberRegex.test(this.value)){

        yearid.classList.add('is-valid');
        yearid.classList.remove('is-invalid');
    }
    else {
        yearid.classList.add('is-invalid');
        yearid.classList.remove('is-valid');
    }

});

// product counter
let quantity_in = document.getElementById("quantity_in")
let quantity_de = document.getElementById("quantity_de")
const quentity_cunt = document.getElementById("quentity_cunt")

quantity_in.addEventListener("click", (event) => {
    const quentity_cunt = document.getElementById("quentity_cunt")
    const qvalue = 1 + parseInt(quentity_cunt.innerHTML)
    quentity_cunt.innerHTML = qvalue
    console.log('start card js')

})
quantity_de.addEventListener("click", (event) => {
   const quentity_cunt = document.getElementById("quentity_cunt")
    const qvalue = parseInt(quentity_cunt.innerHTML) - 1
    if (qvalue >= 0) {
        quentity_cunt.innerHTML = qvalue
    }

})




// quock View product

function addEventListenerList(list, event, fn) {
    for (var i = 0, len = list.length; i < len; i++) {
        list[i].addEventListener(event, fn);
    }
}
console.log('quickViewBtn')
const quickViewBtn = document.querySelectorAll(".quickViewBtn10")
console.log(quickViewBtn)
function addItemInfoToModal(event){
    // console.log("event")
     console.log(event.target.attributes['date-productId'])
    console.log(event.target.getAttribute("date-productId"))
    const quickviewtitle = document.getElementById("quick-view-title")
    const quickviewprice = document.getElementById("quick-view-price")
    const quickviewdetail = document.getElementById("quick-view-detail")
    const quickviewimg = document.getElementById("quick-view-img")
    

    req = new XMLHttpRequest()

    req.onreadystatechange=function(){
        // response receive as a variable named 'req'
        if(req.readyState===4){
            //meaning server process complete
            //we need to check HTTP Response code, 200
            if(req.status===200){
                /// you can proceed
                console.log(req.response)
                received_data = JSON.parse(req.response); // JSON.parse will convert the json string to JS object
                console.log("received data");
                if(received_data['error']==false){
                    ///placing dynamic html table data
                    console.log(received_data['product'][0][0])
                    console.log(received_data['product'][0])
                    quickviewtitle.innerHTML = received_data['product'][0][1]
                    quickviewprice.innerHTML = received_data['product'][0][2]
                    quickviewdetail.innerHTML = received_data['product'][0][7]
                    quickviewimg.setAttribute("src",received_data['product'][0][6])
                    document.getElementById("quick-view-productId").setAttribute("value",received_data['product'][0][0])
                    console.log(document.getElementById("quick-view-productId").getAttribute('value'))
                    // tablebody=document.getElementById('tabledata');

                    // var newrow=document.createElement('tr');
                    // newrow.innerHTML="<td>"+received_data['email']+"</td>";

                    // tablebody.appendChild(newrow);
                }
                else{
                    console.log("error");
                }

            }
        }
    };

    const csrftoken = Cookies.get('csrftoken'); // {% csrf_token %}
    //var csrftokene = getCookie('csrftoken')
    route=document.querySelector('.route').value;
    //productId=document.getElementById('emaproductId').value;
    productId=event.target.getAttribute("date-productId");
     

    req.open("POST", route, true); // true = asynchronous
    req.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); // no need for get request
    req.setRequestHeader('X-CSRFToken', csrftoken);
    req.send("productId="+encodeURIComponent(productId));
    
}
addEventListenerList(quickViewBtn, 'click', addItemInfoToModal);
// quock View product end

// removeItemFromCard
// console.log('removeItemFromCard')
// const removeitem = document.querySelectorAll(".remove-item")
// console.log(removeitem)
// function removeProductFromCard(event){
//     // console.log("event")
//     //  console.log(event.target.attributes['date-productId'])
//     // console.log(event.target.getAttribute("date-productId"))
//     // const quickviewtitle = document.getElementById("quick-view-title")
//     // const quickviewprice = document.getElementById("quick-view-price")
//     // const quickviewdetail = document.getElementById("quick-view-detail")
//     // const quickviewimg = document.getElementById("quick-view-img")
    

//     req = new XMLHttpRequest()

//     req.onreadystatechange=function(){
//         // response receive as a variable named 'req'
//         if(req.readyState===4){
//             //meaning server process complete
//             //we need to check HTTP Response code, 200
//             if(req.status===200){
//                 /// you can proceed
//                 received_data = JSON.parse(req.response); // JSON.parse will convert the json string to JS object
//                 console.log("received data");
//                 if(received_data['error']==false){
//                     ///placing dynamic html table data
//                     console.log(received_data['product'][0][0])
//                     console.log(received_data['product'][0])
//                     quickviewtitle.innerHTML = received_data['product'][0][1]
//                     quickviewprice.innerHTML = received_data['product'][0][2]
//                     quickviewdetail.innerHTML = received_data['product'][0][7]
//                     quickviewimg.setAttribute("src",received_data['product'][0][6])
//                     document.getElementById("quick-view-productId").setAttribute("value",received_data['product'][0][0])
//                     console.log(document.getElementById("quick-view-productId").getAttribute('value'))
//                     // tablebody=document.getElementById('tabledata');

//                     // var newrow=document.createElement('tr');
//                     // newrow.innerHTML="<td>"+received_data['email']+"</td>";

//                     // tablebody.appendChild(newrow);
//                 }
//                 else{
//                     console.log("error");
//                 }

//             }
//         }
//     };

//     const csrftoken = Cookies.get('csrftoken'); // {% csrf_token %}
//     //var csrftokene = getCookie('csrftoken')
//     //route=document.querySelector('.route').value;
//     //productId=document.getElementById('emaproductId').value;
//     productId=event.target.getAttribute("date-productId");
//     route=event.target.getAttribute("date-value");
     

//     req.open("POST", route, true); // true = asynchronous
//     req.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); // no need for get request
//     req.setRequestHeader('X-CSRFToken', csrftoken);
//     req.send("productId="+encodeURIComponent(productId));
    
// }
// addEventListenerList(removeitem, 'click', removeProductFromCard);





// removeItemFromCard end

//  quantity_in = document.getElementById("quantity_in")
//  quantity_de = document.getElementById("quantity_de")

// console.log(quentity_cunt.innerHTML)
// quantity_in.addEventListener("click", (event) => {
//     const quentity_cunt = document.getElementById("quentity_cunt")
//     const qvalue = 1 + parseInt(quentity_cunt.innerHTML)
//     quentity_cunt.innerHTML = qvalue

// })
// quantity_de.addEventListener("click", (event) => {
//    const quentity_cunt = document.getElementById("quentity_cunt")
//     const qvalue = parseInt(quentity_cunt.innerHTML) - 1
//     if (qvalue >= 0) {
//         quentity_cunt.innerHTML = qvalue
//     }

// })




const checkoutBtn = document.querySelector(".checkoutBtn")
console.log(checkoutBtn)
checkoutBtn.addEventListener('click',chackForelogin)
function chackForelogin(event){

    req = new XMLHttpRequest()

    req.onreadystatechange=function(){
        // response receive as a variable named 'req'
        if(req.readyState===4){
            //meaning server process complete
            //we need to check HTTP Response code, 200
            if(req.status===200){
                /// you can proceed
                console.log(req.response)
                received_data = JSON.parse(req.response); // JSON.parse will convert the json string to JS object
                console.log("received data");
                if(received_data['error']==false){
                    
                    if(received_data['userPresent']==true)
                    {
                        $("#chackout-payment").modal();
                    }
                    else
                    {
                        alert("Login Fast");
                        $("#login").modal();
                    }
                }
                else{
                    console.log("error ");
                }

            }
        }
    };

    const csrftoken = Cookies.get('csrftoken'); // {% csrf_token %}
    //var csrftokene = getCookie('csrftoken')
    //route=document.querySelector('.route').value;
    //productId=document.getElementById('emaproductId').value;
    route=event.target.getAttribute("data-route");
    console.log(route)
     
    const p=100
    req.open("POST", route, true); // true = asynchronous
    req.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); // no need for get request
    req.setRequestHeader('X-CSRFToken', csrftoken);
    req.send();
    
}

