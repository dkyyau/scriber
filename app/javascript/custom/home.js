//banner animation
const mainTitle = document.getElementById('main-title');
const creditcard = document.getElementById('creditcard');
const btnAction = document.querySelector('.btn-action');
const check = document.getElementById('check');
const showcase = document.querySelector('.showcase');
const subslist = document.querySelector('.promote');
check.style.display = "none";
subslist.style.display = "";
subslist.style.opacity = "0";
creditcard.classList.add('show');


const pageLoad = () => {
    mainTitle.innerHTML = "Opps, looks like you forgot to cancel";
    //susbs list animation
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
    subslist.style.display = "";
    subslist.style.opacity = "0"
}
pageLoad();


