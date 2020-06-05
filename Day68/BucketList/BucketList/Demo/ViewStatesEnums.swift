//
//  ViewStatesEnums.swift
//  BucketList
//
//  Created by Victor Rolando Sanchez Jara on 6/2/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct ViewStatesEnums: View {
    var loadingState: LoadingStateOld = .loading

    var body: some View {
        Group {
            if loadingState == .loading {
                LoadingView()
            } else if loadingState == .success {
                SuccessView()
            } else if loadingState == .failed {
                FailedView()
            }
        }
    }
}

struct ViewStatesEnums_Previews: PreviewProvider {
    static var previews: some View {
        ViewStatesEnums()
    }
}


enum LoadingStateOld {
    case loading, success, failed
}

struct LoadingView: View {
    var body: some View {
        Text("Loading...")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success!")
    }
}

struct FailedView: View {
    var body: some View {
        Text("Failed.")
    }
}
