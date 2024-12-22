/** @format */
function debounce(func, timeout = 500) {
	let timer;
	return (...args) => {
		clearTimeout(timer);
		timer = setTimeout(() => {
			func.apply(this, args);
		}, timeout);
	};
}

const processChange = debounce((keyword) => callFetchBooks(keyword));
function callFetchBooks(keyword) {
	$.ajax({
		url: "/ajax_search_books",
		type: "GET",
		dataType: "json",
		data: { search: keyword },
		success: function (res) {
			console.log(res);
			$(".list-book-content").html(res.partial);
            console.log($(".list-book-content").html(res.partial))
		},
	});
}

$(function () {
	const searchInput = $("#search-input");
	searchInput.on("keyup", function () {
		const keyword = searchInput.val();
		processChange(keyword);
	});
});
