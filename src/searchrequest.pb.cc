// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: searchrequest.proto

#define INTERNAL_SUPPRESS_PROTOBUF_FIELD_DEPRECATION
#include "searchrequest.pb.h"

#include <algorithm>

#include <google/protobuf/stubs/common.h>
#include <google/protobuf/stubs/once.h>
#include <google/protobuf/io/coded_stream.h>
#include <google/protobuf/wire_format_lite_inl.h>
#include <google/protobuf/descriptor.h>
#include <google/protobuf/generated_message_reflection.h>
#include <google/protobuf/reflection_ops.h>
#include <google/protobuf/wire_format.h>
// @@protoc_insertion_point(includes)

namespace {

const ::google::protobuf::Descriptor* SearchRequest_descriptor_ = NULL;
const ::google::protobuf::internal::GeneratedMessageReflection*
  SearchRequest_reflection_ = NULL;

}  // namespace


void protobuf_AssignDesc_searchrequest_2eproto() {
  protobuf_AddDesc_searchrequest_2eproto();
  const ::google::protobuf::FileDescriptor* file =
    ::google::protobuf::DescriptorPool::generated_pool()->FindFileByName(
      "searchrequest.proto");
  GOOGLE_CHECK(file != NULL);
  SearchRequest_descriptor_ = file->message_type(0);
  static const int SearchRequest_offsets_[3] = {
    GOOGLE_PROTOBUF_GENERATED_MESSAGE_FIELD_OFFSET(SearchRequest, query_),
    GOOGLE_PROTOBUF_GENERATED_MESSAGE_FIELD_OFFSET(SearchRequest, page_number_),
    GOOGLE_PROTOBUF_GENERATED_MESSAGE_FIELD_OFFSET(SearchRequest, result_per_page_),
  };
  SearchRequest_reflection_ =
    new ::google::protobuf::internal::GeneratedMessageReflection(
      SearchRequest_descriptor_,
      SearchRequest::default_instance_,
      SearchRequest_offsets_,
      GOOGLE_PROTOBUF_GENERATED_MESSAGE_FIELD_OFFSET(SearchRequest, _has_bits_[0]),
      GOOGLE_PROTOBUF_GENERATED_MESSAGE_FIELD_OFFSET(SearchRequest, _unknown_fields_),
      -1,
      ::google::protobuf::DescriptorPool::generated_pool(),
      ::google::protobuf::MessageFactory::generated_factory(),
      sizeof(SearchRequest));
}

namespace {

GOOGLE_PROTOBUF_DECLARE_ONCE(protobuf_AssignDescriptors_once_);
inline void protobuf_AssignDescriptorsOnce() {
  ::google::protobuf::GoogleOnceInit(&protobuf_AssignDescriptors_once_,
                 &protobuf_AssignDesc_searchrequest_2eproto);
}

void protobuf_RegisterTypes(const ::std::string&) {
  protobuf_AssignDescriptorsOnce();
  ::google::protobuf::MessageFactory::InternalRegisterGeneratedMessage(
    SearchRequest_descriptor_, &SearchRequest::default_instance());
}

}  // namespace

void protobuf_ShutdownFile_searchrequest_2eproto() {
  delete SearchRequest::default_instance_;
  delete SearchRequest_reflection_;
}

void protobuf_AddDesc_searchrequest_2eproto() {
  static bool already_here = false;
  if (already_here) return;
  already_here = true;
  GOOGLE_PROTOBUF_VERIFY_VERSION;

  ::google::protobuf::DescriptorPool::InternalAddGeneratedFile(
    "\n\023searchrequest.proto\"L\n\rSearchRequest\022\r"
    "\n\005query\030\001 \002(\t\022\023\n\013page_number\030\002 \002(\005\022\027\n\017re"
    "sult_per_page\030\003 \002(\005", 99);
  ::google::protobuf::MessageFactory::InternalRegisterGeneratedFile(
    "searchrequest.proto", &protobuf_RegisterTypes);
  SearchRequest::default_instance_ = new SearchRequest();
  SearchRequest::default_instance_->InitAsDefaultInstance();
  ::google::protobuf::internal::OnShutdown(&protobuf_ShutdownFile_searchrequest_2eproto);
}

// Force AddDescriptors() to be called at static initialization time.
struct StaticDescriptorInitializer_searchrequest_2eproto {
  StaticDescriptorInitializer_searchrequest_2eproto() {
    protobuf_AddDesc_searchrequest_2eproto();
  }
} static_descriptor_initializer_searchrequest_2eproto_;

// ===================================================================

#ifndef _MSC_VER
const int SearchRequest::kQueryFieldNumber;
const int SearchRequest::kPageNumberFieldNumber;
const int SearchRequest::kResultPerPageFieldNumber;
#endif  // !_MSC_VER

SearchRequest::SearchRequest()
  : ::google::protobuf::Message() {
  SharedCtor();
  // @@protoc_insertion_point(constructor:SearchRequest)
}

void SearchRequest::InitAsDefaultInstance() {
}

SearchRequest::SearchRequest(const SearchRequest& from)
  : ::google::protobuf::Message() {
  SharedCtor();
  MergeFrom(from);
  // @@protoc_insertion_point(copy_constructor:SearchRequest)
}

void SearchRequest::SharedCtor() {
  ::google::protobuf::internal::GetEmptyString();
  _cached_size_ = 0;
  query_ = const_cast< ::std::string*>(&::google::protobuf::internal::GetEmptyStringAlreadyInited());
  page_number_ = 0;
  result_per_page_ = 0;
  ::memset(_has_bits_, 0, sizeof(_has_bits_));
}

SearchRequest::~SearchRequest() {
  // @@protoc_insertion_point(destructor:SearchRequest)
  SharedDtor();
}

void SearchRequest::SharedDtor() {
  if (query_ != &::google::protobuf::internal::GetEmptyStringAlreadyInited()) {
    delete query_;
  }
  if (this != default_instance_) {
  }
}

void SearchRequest::SetCachedSize(int size) const {
  GOOGLE_SAFE_CONCURRENT_WRITES_BEGIN();
  _cached_size_ = size;
  GOOGLE_SAFE_CONCURRENT_WRITES_END();
}
const ::google::protobuf::Descriptor* SearchRequest::descriptor() {
  protobuf_AssignDescriptorsOnce();
  return SearchRequest_descriptor_;
}

const SearchRequest& SearchRequest::default_instance() {
  if (default_instance_ == NULL) protobuf_AddDesc_searchrequest_2eproto();
  return *default_instance_;
}

SearchRequest* SearchRequest::default_instance_ = NULL;

SearchRequest* SearchRequest::New() const {
  return new SearchRequest;
}

void SearchRequest::Clear() {
#define OFFSET_OF_FIELD_(f) (reinterpret_cast<char*>(      \
  &reinterpret_cast<SearchRequest*>(16)->f) - \
   reinterpret_cast<char*>(16))

#define ZR_(first, last) do {                              \
    size_t f = OFFSET_OF_FIELD_(first);                    \
    size_t n = OFFSET_OF_FIELD_(last) - f + sizeof(last);  \
    ::memset(&first, 0, n);                                \
  } while (0)

  if (_has_bits_[0 / 32] & 7) {
    ZR_(page_number_, result_per_page_);
    if (has_query()) {
      if (query_ != &::google::protobuf::internal::GetEmptyStringAlreadyInited()) {
        query_->clear();
      }
    }
  }

#undef OFFSET_OF_FIELD_
#undef ZR_

  ::memset(_has_bits_, 0, sizeof(_has_bits_));
  mutable_unknown_fields()->Clear();
}

bool SearchRequest::MergePartialFromCodedStream(
    ::google::protobuf::io::CodedInputStream* input) {
#define DO_(EXPRESSION) if (!(EXPRESSION)) goto failure
  ::google::protobuf::uint32 tag;
  // @@protoc_insertion_point(parse_start:SearchRequest)
  for (;;) {
    ::std::pair< ::google::protobuf::uint32, bool> p = input->ReadTagWithCutoff(127);
    tag = p.first;
    if (!p.second) goto handle_unusual;
    switch (::google::protobuf::internal::WireFormatLite::GetTagFieldNumber(tag)) {
      // required string query = 1;
      case 1: {
        if (tag == 10) {
          DO_(::google::protobuf::internal::WireFormatLite::ReadString(
                input, this->mutable_query()));
          ::google::protobuf::internal::WireFormat::VerifyUTF8StringNamedField(
            this->query().data(), this->query().length(),
            ::google::protobuf::internal::WireFormat::PARSE,
            "query");
        } else {
          goto handle_unusual;
        }
        if (input->ExpectTag(16)) goto parse_page_number;
        break;
      }

      // required int32 page_number = 2;
      case 2: {
        if (tag == 16) {
         parse_page_number:
          DO_((::google::protobuf::internal::WireFormatLite::ReadPrimitive<
                   ::google::protobuf::int32, ::google::protobuf::internal::WireFormatLite::TYPE_INT32>(
                 input, &page_number_)));
          set_has_page_number();
        } else {
          goto handle_unusual;
        }
        if (input->ExpectTag(24)) goto parse_result_per_page;
        break;
      }

      // required int32 result_per_page = 3;
      case 3: {
        if (tag == 24) {
         parse_result_per_page:
          DO_((::google::protobuf::internal::WireFormatLite::ReadPrimitive<
                   ::google::protobuf::int32, ::google::protobuf::internal::WireFormatLite::TYPE_INT32>(
                 input, &result_per_page_)));
          set_has_result_per_page();
        } else {
          goto handle_unusual;
        }
        if (input->ExpectAtEnd()) goto success;
        break;
      }

      default: {
      handle_unusual:
        if (tag == 0 ||
            ::google::protobuf::internal::WireFormatLite::GetTagWireType(tag) ==
            ::google::protobuf::internal::WireFormatLite::WIRETYPE_END_GROUP) {
          goto success;
        }
        DO_(::google::protobuf::internal::WireFormat::SkipField(
              input, tag, mutable_unknown_fields()));
        break;
      }
    }
  }
success:
  // @@protoc_insertion_point(parse_success:SearchRequest)
  return true;
failure:
  // @@protoc_insertion_point(parse_failure:SearchRequest)
  return false;
#undef DO_
}

void SearchRequest::SerializeWithCachedSizes(
    ::google::protobuf::io::CodedOutputStream* output) const {
  // @@protoc_insertion_point(serialize_start:SearchRequest)
  // required string query = 1;
  if (has_query()) {
    ::google::protobuf::internal::WireFormat::VerifyUTF8StringNamedField(
      this->query().data(), this->query().length(),
      ::google::protobuf::internal::WireFormat::SERIALIZE,
      "query");
    ::google::protobuf::internal::WireFormatLite::WriteStringMaybeAliased(
      1, this->query(), output);
  }

  // required int32 page_number = 2;
  if (has_page_number()) {
    ::google::protobuf::internal::WireFormatLite::WriteInt32(2, this->page_number(), output);
  }

  // required int32 result_per_page = 3;
  if (has_result_per_page()) {
    ::google::protobuf::internal::WireFormatLite::WriteInt32(3, this->result_per_page(), output);
  }

  if (!unknown_fields().empty()) {
    ::google::protobuf::internal::WireFormat::SerializeUnknownFields(
        unknown_fields(), output);
  }
  // @@protoc_insertion_point(serialize_end:SearchRequest)
}

::google::protobuf::uint8* SearchRequest::SerializeWithCachedSizesToArray(
    ::google::protobuf::uint8* target) const {
  // @@protoc_insertion_point(serialize_to_array_start:SearchRequest)
  // required string query = 1;
  if (has_query()) {
    ::google::protobuf::internal::WireFormat::VerifyUTF8StringNamedField(
      this->query().data(), this->query().length(),
      ::google::protobuf::internal::WireFormat::SERIALIZE,
      "query");
    target =
      ::google::protobuf::internal::WireFormatLite::WriteStringToArray(
        1, this->query(), target);
  }

  // required int32 page_number = 2;
  if (has_page_number()) {
    target = ::google::protobuf::internal::WireFormatLite::WriteInt32ToArray(2, this->page_number(), target);
  }

  // required int32 result_per_page = 3;
  if (has_result_per_page()) {
    target = ::google::protobuf::internal::WireFormatLite::WriteInt32ToArray(3, this->result_per_page(), target);
  }

  if (!unknown_fields().empty()) {
    target = ::google::protobuf::internal::WireFormat::SerializeUnknownFieldsToArray(
        unknown_fields(), target);
  }
  // @@protoc_insertion_point(serialize_to_array_end:SearchRequest)
  return target;
}

int SearchRequest::ByteSize() const {
  int total_size = 0;

  if (_has_bits_[0 / 32] & (0xffu << (0 % 32))) {
    // required string query = 1;
    if (has_query()) {
      total_size += 1 +
        ::google::protobuf::internal::WireFormatLite::StringSize(
          this->query());
    }

    // required int32 page_number = 2;
    if (has_page_number()) {
      total_size += 1 +
        ::google::protobuf::internal::WireFormatLite::Int32Size(
          this->page_number());
    }

    // required int32 result_per_page = 3;
    if (has_result_per_page()) {
      total_size += 1 +
        ::google::protobuf::internal::WireFormatLite::Int32Size(
          this->result_per_page());
    }

  }
  if (!unknown_fields().empty()) {
    total_size +=
      ::google::protobuf::internal::WireFormat::ComputeUnknownFieldsSize(
        unknown_fields());
  }
  GOOGLE_SAFE_CONCURRENT_WRITES_BEGIN();
  _cached_size_ = total_size;
  GOOGLE_SAFE_CONCURRENT_WRITES_END();
  return total_size;
}

void SearchRequest::MergeFrom(const ::google::protobuf::Message& from) {
  GOOGLE_CHECK_NE(&from, this);
  const SearchRequest* source =
    ::google::protobuf::internal::dynamic_cast_if_available<const SearchRequest*>(
      &from);
  if (source == NULL) {
    ::google::protobuf::internal::ReflectionOps::Merge(from, this);
  } else {
    MergeFrom(*source);
  }
}

void SearchRequest::MergeFrom(const SearchRequest& from) {
  GOOGLE_CHECK_NE(&from, this);
  if (from._has_bits_[0 / 32] & (0xffu << (0 % 32))) {
    if (from.has_query()) {
      set_query(from.query());
    }
    if (from.has_page_number()) {
      set_page_number(from.page_number());
    }
    if (from.has_result_per_page()) {
      set_result_per_page(from.result_per_page());
    }
  }
  mutable_unknown_fields()->MergeFrom(from.unknown_fields());
}

void SearchRequest::CopyFrom(const ::google::protobuf::Message& from) {
  if (&from == this) return;
  Clear();
  MergeFrom(from);
}

void SearchRequest::CopyFrom(const SearchRequest& from) {
  if (&from == this) return;
  Clear();
  MergeFrom(from);
}

bool SearchRequest::IsInitialized() const {
  if ((_has_bits_[0] & 0x00000007) != 0x00000007) return false;

  return true;
}

void SearchRequest::Swap(SearchRequest* other) {
  if (other != this) {
    std::swap(query_, other->query_);
    std::swap(page_number_, other->page_number_);
    std::swap(result_per_page_, other->result_per_page_);
    std::swap(_has_bits_[0], other->_has_bits_[0]);
    _unknown_fields_.Swap(&other->_unknown_fields_);
    std::swap(_cached_size_, other->_cached_size_);
  }
}

::google::protobuf::Metadata SearchRequest::GetMetadata() const {
  protobuf_AssignDescriptorsOnce();
  ::google::protobuf::Metadata metadata;
  metadata.descriptor = SearchRequest_descriptor_;
  metadata.reflection = SearchRequest_reflection_;
  return metadata;
}


// @@protoc_insertion_point(namespace_scope)

// @@protoc_insertion_point(global_scope)
