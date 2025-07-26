#pragma once
#include "route_guide.grpc.pb.h"

using routeguide::RouteGuide;

class RouteGuideService final : public RouteGuide::Service
{
public:
    grpc::Status GetFeature(grpc::ServerContext* ctx,
        const routeguide::Point* req,
        routeguide::Feature* resp) override
    {
        // TODO: req.latitude(), req.longitude() 이용해 DB/메모리 조회
        // 예시 – 이름이 없으면 빈 Feature 반환
        resp->mutable_location()->CopyFrom(*req);
        resp->set_name("Mount FooBar");
        return grpc::Status::OK;
    }

    grpc::Status ListFeatures(grpc::ServerContext* ctx,
        const routeguide::Rectangle* req,
        grpc::ServerWriter<routeguide::Feature>* writer) override
    {
        // TODO: req->lo()/hi() 범위 순회하며 반복 writer->Write(feature);
        return grpc::Status::OK;
    }

    grpc::Status RecordRoute(grpc::ServerContext* ctx,
        grpc::ServerReader<routeguide::Point>* reader,
        routeguide::RouteSummary* resp) override
    {
        // TODO: reader->Read(&pt) 반복 → 통계 계산 후 resp 세팅
        return grpc::Status::OK;
    }

    grpc::Status RouteChat(grpc::ServerContext* ctx,
        grpc::ServerReaderWriter<routeguide::RouteNote,
        routeguide::RouteNote>* stream) override
    {
        // TODO: RouteNote ↔ echo / 브로드캐스트 등
        return grpc::Status::OK;
    }
};