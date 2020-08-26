//banner animation
const mainTitle = document.getElementById('main-title');
const creditcard = document.getElementById('creditcard');
const check = document.getElementById('check');
const showcase = document.querySelector('.showcase');
const subslist = document.querySelector('.promote');
const navHome = document.querySelector('.navbar-brand');

check.style.display = "none";
subslist.style.display = "";
subslist.style.opacity = "0";
creditcard.classList.add('show-card');


const pageLoad = () => {
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
pageLoad();

navHome.addEventListener('click', function refreshPage(){
    window.location.reload();
}  );
