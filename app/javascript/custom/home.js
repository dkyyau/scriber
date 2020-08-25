//banner animation
const runButton =document.getElementById('runAway');
const mainTitle = document.getElementById('main-title');
const creditcard = document.getElementById('creditcard');
const btnAction =document.querySelector('.btn-action');
const btnSignup = document.querySelector('#btn-signup');
const check = document.getElementById('check');

btnSignup.style.display="none";
check.style.display="none";
runButton.addEventListener('mouseover',()=>{
runButton.classList.add('hide');
creditcard.classList.add('show');
mainTitle.innerHTML="Opps, looks like you forgot to cancel";
setTimeout(()=>{runButton.style.visibility="hidden", creditcard.style.display="none", check.style.display=""}, 4000);
btnSignup.style.display="";
setTimeout(()=>{mainTitle.innerHTML="Keep track of your subscriptions today", btnSignup.classList.add('showup')}, 3000);
});




 //susbs list animation


    document.addEventListener('aos:in:showsubs', () => {
 const subsListAnimation=()=>{
    const subsListAnimation = document.querySelectorAll('#subs-display-animation li');
const promote = document.querySelector('.promote');
   subsListAnimation.forEach((item)=>{
       item.classList.add('activate-sub-animation');
   });
};
 subsListAnimation();
});


