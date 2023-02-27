class ApiResponse<T> {
  Status status;
  T? data;
  String? message;
  ApiResponse.initial(this.message) : status = Status.INITIAL;
  ApiResponse.loading(this.message) : status = Status.LOADING;
  ApiResponse.uploading(this.message) : status = Status.UPLOADING;
  ApiResponse.completed(this.data) : status = Status.COMPLETED;
  ApiResponse.error(this.message) : status = Status.ERROR;
  ApiResponse.deleting(this.message) : status = Status.DELETING;
  @override
  String toString() {
    return "Status: $status\n Message\n : $message  Data: $data";
  }
}

enum Status { INITIAL, LOADING, COMPLETED, ERROR, UPLOADING, DELETING }
