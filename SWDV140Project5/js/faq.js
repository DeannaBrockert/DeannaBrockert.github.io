"use strict";


//faqs
const toggle = evt => {
    const spanElement = evt.currentTarget;
    const h5Element = spanElement.nextElementSibling;
    const h4Element = h5Element.nextElementSibling;
    const pElement = h4Element.nextElementSibling;

    if (pElement.hasAttribute("class")) {
        pElement.removeAttribute("class");
    } else {
        pElement.className="display_text";
    }

    evt.preventDefault();

};

document.addEventListener("DOMContentLoaded", () => {
    const spanElements = faq.querySelectorAll("#faq_span");

    for (let spanElement of spanElements) {
        spanElement.addEventListener("click", toggle);
    }

    spanElements[0].focus();
});