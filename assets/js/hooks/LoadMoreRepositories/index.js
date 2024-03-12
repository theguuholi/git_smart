const LoadMoreRepositories = {
  mounted() {
    this.observer = new IntersectionObserver((entries) => {
      const entry = entries[0];
      if (entry.isIntersecting) {
        this.pushEvent("load_more");
      }
    });

    this.observer.observe(this.el);
  },
};

export default LoadMoreRepositories;
