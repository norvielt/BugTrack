Vue.http.interceptors.push({
  request: function (request) {
    Vue.http.headers.common['X-CSRF-Token'] = $('[name="csrf-token"]').attr('content');
    return request;
  },
  response: function (response) {
    return response;
  }
});

var bugResource = Vue.resource('/buglist{/id}.json')

Vue.component('bug-row', {
  template: '#bug-row',
  props: {
    bug: Object
  },
  data: function () {
    return {
      editMode: false,
      errors: {}
    }
  },
  methods: {
    updateBug: function () {
      var that = this;
      bugResource.update({id: that.bug.id}, {bug: that.bug}).then(
        function(response) {
          that.errors = {}
          that.bug = response.data
          that.editMode = false
        },
        function(response) {
          that.errors = response.data.errors
        }
      )
    },
    deleteBug: function () {
      var that = this;
      bugResource.delete({id: that.bug.id}).then(
        function (response) {
          that.$remove()
        }
      )
    }
  }
})

var buglist = new Vue({
  el: '#buglist',
  data: {
    buglist: [],
    bug: {
      			issue_type: '',
						issue_date: '',
						priority_level: '',
						issue_name: '',
						issue_desc: '',
						comments: '',
						assigned_to_name: '',
						assigned_to_email: '',
						issue_status: ''
    },
    errors: {}
  },
  ready: function() {
    var that;
    that = this;
    bugResource.get().then(
      function (response) {
        that.buglist = response.data
      }
    )
  },
  methods: {
    addBug: function () {
      var that = this;
      bugResource.save({bug: this.bug}).then(
        function(response) {
          that.errors = {};
          that.bug = {};
          that.buglist.push(response.data);
        },
        function(response) {
          that.errors = response.data.errors
        }
      )
    }
  }
});
