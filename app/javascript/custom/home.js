
export const homeAnimation = () => {
    //banner animation
const mainTitle = document.getElementById('main-title');
const creditcard = document.getElementById('creditcard');
const check = document.getElementById('check');
const showcase = document.querySelector('.showcase');
const subslist = document.querySelector('.promote');
const navHome = document.querySelector('.navbar-brand');
const homeLink = document.querySelector('.home-link');

creditcard.classList.add('show-card');
check.style.display = "none";
subslist.style.display = "none";


const pageLoad = () => {
  subslist.style.display = "none";
  mainTitle.innerHTML = "Never forget to cancel a subscription";
  //subs list animation
  const subsListAnimation = () => {
    subslist.style.opacity = "1";
    const subsListAnimation = document.querySelectorAll('#subs-display-animation li');
    const promote = document.querySelector('.promote');
    subsListAnimation.forEach((item) => {
      item.classList.add('activate-sub-animation');
    });
  };
  setTimeout(() => {
    subslist.style.display = "";
    subsListAnimation()
  }, 3000);
  setTimeout(() => {
    creditcard.style.display = "none"
  }, 4100);
  setTimeout(() => {
    mainTitle.innerHTML = "Keep track of your subscriptions today", clearList(), check.style.display = ""
  }, 8000);
};

const clearList = () => {
  subslist.style.display = "none";
  subslist.visibility = "hidden";
}


window.onload = function() {
  pageLoad();
};

setTimeout(function() {
  subslist.style.visibility='none';
}, 17000);

}







