variable "tags" {
    type        = map(string)
    description = "mandatory tags"
    default     = {
        "testKey" = "testValue"
    }
}