const revealItems = document.querySelectorAll(".reveal");

const observer = new IntersectionObserver(
  (entries) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        entry.target.classList.add("show");
        observer.unobserve(entry.target);
      }
    });
  },
  { threshold: 0.2 }
);

revealItems.forEach((item) => observer.observe(item));

const contactForm = document.querySelector(".contact-form");
if (contactForm) {
  contactForm.addEventListener("submit", (e) => {
    e.preventDefault();
    const button = contactForm.querySelector("button");
    button.textContent = "Message Sent";
    button.disabled = true;
    setTimeout(() => {
      contactForm.reset();
      button.textContent = "Send Message";
      button.disabled = false;
    }, 1600);
  });
}
